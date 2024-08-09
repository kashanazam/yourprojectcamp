<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;
use App\Models\Service;
use Response;
use App\Models\User;
use App\Models\Message;
use App\Models\ClientFile;
use App\Models\Project;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use App\Events\MessageSent;
use Illuminate\Support\Str;
use App\Notifications\MessageNotification;
use Auth;
use Notification;
use \Carbon\Carbon;
use DateTimeZone;
use Pusher\Pusher;
use Illuminate\Support\Facades\Storage;

class ClientChatController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    
    public function clientHome(){
        return view('client.home');
    }

    public function clientChat(){
        return view('client.chat');
    }

    public function fetchMessages()
    {
        return Message::where('user_id', Auth()->user()->id)->orWhere('recieve_id', Auth()->user()->id)->with('user')->get();
    }

    public function sendMessage(Request $request)
    {

        $this->validate($request, [
            'message' => 'required',
        ]);
        $carbon = Carbon::now(new DateTimeZone('America/Los_Angeles'))->toDateTimeString();
        // send Notification to customer
        $message = new Message();
        $message->user_id = Auth::user()->id;
        $message->sender_id = Auth::user()->id;
        $message->message = $request->message;
        $message->role_id = 3;
        $message->created_at = $carbon;
        $message->client_id = Auth::user()->id;
        $message->save();
        $email = Auth()->user()->email;
        if($request->hasfile('h_Item_Attachments_FileInput'))
        {
            $files_array = array();
            $i = 0;
            foreach($request->file('h_Item_Attachments_FileInput') as $file)
            {
                $disk = Storage::disk('wasabi');
                $data = $disk->put('messages/'.$email, $file);
                $disk->setVisibility($data, 'public');
                $file_name = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $name = $file_name . '_' . $i . '_]' .time().'.'.$file->extension();
                // $file->move(public_path().'/files/', $name);
                $i++;
                $client_file = new ClientFile();
                $client_file->name = $file_name;
                $client_file->path = $data;
                $client_file->task_id = -1;
                $client_file->user_id = Auth()->user()->id;
                $client_file->user_check = Auth()->user()->is_employee;
                $client_file->production_check = 2;
                $client_file->message_id = $message->id;
                $client_file->created_at = $carbon;
                $client_file->save();
            }
        }

        $client = User::find(Auth::user()->id);

        $details = [
            'sender_name' => Auth::user()->name . ' ' . Auth::user()->last_name,
            'sender_email' => Auth::user()->email,
            'brand_name' => $client->client->brand->name,
            'brand_logo' => $client->client->brand->logo,
            'brand_phone' => $client->client->brand->phone,
            'brand_email' => $client->client->brand->email,
            'brand_address' => $client->client->brand->address,
            'name' => $client->name,
            'email' => $client->email,
            'contact' => $client->contact,
            'date' => $carbon,
            'discription' => $request->message
        ];
        
        $messageData = [
            'id' => Auth()->user()->id,
            'name' => Auth()->user()->name . ' ' . Auth()->user()->last_name,
            'text' => Auth()->user()->name . ' ' . Auth()->user()->last_name . ' has send you a Message',
            'details' => Str::limit(filter_var($request->message, FILTER_SANITIZE_STRING), 40 ),
            'url' => '',
        ];
        
        $pusher = new Pusher(
            env('PUSHER_APP_KEY'),
            env('PUSHER_APP_SECRET'),
            env('PUSHER_APP_ID'),
            [
                'cluster' => env('PUSHER_APP_CLUSTER'),
                'useTLS' => true,
            ]
        );
        $sale = User::find(Auth::user()->client->user_id);
        $projects = Project::select('user_id')->where('client_id', Auth::user()->id)->get();
        foreach($projects as $project){
            \Mail::to($project->added_by->email)->send(new \App\Mail\ClientNotifyMail($details));
            $project->added_by->notify(new MessageNotification($messageData));
            $last_notify = $project->added_by->notifications()->latest()->first();
            $pusher->trigger('private.' .  $project->added_by->id, 'receivemessage', ['title' => 'Incoming Message', 'full_message' => $request->message ,'message' => \Illuminate\Support\Str::limit(strip_tags($request->message), 40, '...'), 'user' => Auth::user(), 'date' =>  now()->format('d m, y'), 'image' => 'new-message.png', 'link' => route('client.message', ['notify' => $last_notify->id])]);
        }
       
        $adminusers = User::where('is_employee', 2)->get();
        foreach($adminusers as $adminuser){
            Notification::send($adminuser, new MessageNotification($messageData));
        }

        return redirect()->back()->with('success', 'Message Send Successfully.');
    }

}
