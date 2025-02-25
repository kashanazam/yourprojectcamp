<?php

namespace App\Http\Controllers;

use App\Models\BrandLeads;
use App\Models\DesignnesChatDump;
use App\Models\LeadsData;
use App\Models\Brand;
use App\Models\Client;
use App\Models\Invoice;
use App\Models\MarketingNotchChatDump;
use App\Models\TelnyxCallLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Requests\StoreLeadRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class LeadsDashboardController extends Controller
{
    public function generateLeadNo()
    {
        return str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
    }

    public function formatNumbers($phone)
    {
        return preg_replace('/[ \,\.\-\(\)\+\s]/', '', $phone);
    }

    public function phone_arrange($phone)
    {
        if (strlen($phone) <= 14) {
            return substr($this->formatNumbers($phone), -6);
        } else {
            // Multiple numbers case
            $phone_num = [];
            $part1 = substr($this->formatNumbers($phone), 0, strlen($this->formatNumbers($phone)) / 2);
            $part2 = substr($this->formatNumbers($phone), strlen($this->formatNumbers($phone)) / 2);

            $last6Part1 = substr($part1, -6);
            $last6Part2 = substr($part2, -6);
            $phone_num['p1'] = $last6Part1;
            $phone_num['p2'] = $last6Part2;
            return $phone_num;
        }
    }

    public function dashboard()
    {
        return view('leads.dashboard');
    }

    public function index(Request $request)
    {
        // Fetch the request inputs
        $filters = $request->only([
            'invoice_no',
            'client_name',
            'client_email',
            'client_phone',
            'date_time',
            'column_name',
            'client_ip',
            'agent_name'
        ]);

        // Apply filters directly in the query
        $query = Invoice::with('brands')->orderBy('created_at', 'DESC');

        if (!empty($filters['invoice_no'])) {
            $query->where('invoice_number', '=', $filters['invoice_no']);
        }
        if (!empty($filters['client_name'])) {
            $query->where('name', 'LIKE', "%{$filters['client_name']}%");
        }
        if (!empty($filters['client_email'])) {
            $query->where('email', 'LIKE', "%{$filters['client_email']}%");
        }
        if (!empty($filters['client_phone'])) {
            $client_phone = substr(preg_replace('/[ \,\.\-\(\)\+\s]/', '', $filters['client_phone']), -6);
            $query->whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(contact, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$client_phone%"]);
        }
        if (!empty($filters['date_time'])) {
            $this->applyDateFilter($query, $filters['date_time'], $filters['column_name']);
        }
        if (!empty($filters['agent_name'])) {
            $_Zendesk_Dump = DesignnesChatDump::where('agent_names', 'LIKE', "%{$filters['agent_name']}%")->get();
        }

        $_Invoices = $query->paginate(20);

        // Fetch related data
        $_Call_Logs = TelnyxCallLog::all();
        $_Zendesk_Dump = DesignnesChatDump::all();
        $_Marketing_Notch_Dump = MarketingNotchChatDump::all();
        $_Brand_Leads = BrandLeads::all();
        $_Leads_Data = LeadsData::all();
        $brands = Brand::all();

        // Process data
        $_data = $this->processInvoices($_Invoices, $_Call_Logs, $_Zendesk_Dump, $_Marketing_Notch_Dump, $_Brand_Leads, $_Leads_Data);

        // Fetch unmatched data
        $_unmatched_data = $this->fetchUnmatchedData($_data);

        return view('leads.index', compact('_data', '_unmatched_data', 'brands', '_Invoices'));
    }

    private function applyDateFilter($query, $date_time, $column_name)
    {
        if ($column_name == 'invoice') {
            $query->whereDate('created_at', '=', $date_time);
        } elseif ($column_name == 'call_data_telnyx' || $column_name == 'call_data_ring_central') {
            $_Call_Logs = TelnyxCallLog::whereDate('started_at', '=', $date_time)->get();
        } elseif ($column_name == 'designnes_chat') {
            $_Zendesk_Dump = DesignnesChatDump::whereDate('session_start_date', '=', $date_time)->get();
        } elseif ($column_name == 'marketing_notch_chat') {
            $_Marketing_Notch_Dump = MarketingNotchChatDump::whereDate('session_start_date', '=', $date_time)->get();
        }
    }

    private function processInvoices($invoices, $_Call_Logs, $_Zendesk_Dump, $_Marketing_Notch_Dump, $_Brand_Leads, $_Leads_Data)
    {
        $_data = [];
        $processedInvoices = [];

        foreach ($invoices as $invoice) {
            $uniqueKey = $invoice->invoice_number . '-' . $invoice->email;
            if (in_array($uniqueKey, $processedInvoices)) {
                continue; // Skip already processed invoices
            }

            $contact_last6 = substr(preg_replace('/[ \,\.\-\(\)\+\s]/', '', $invoice->contact), -6);
            $email = $invoice->email;

            $_data[$invoice->invoice_number] = [
                'call_log_direction' => $this->findMatchingRecord($_Call_Logs, $contact_last6, $email, 'cld', 'cli') ?? 'N/A',
                'designnes_chat_dump' => $this->findMatchingRecord($_Zendesk_Dump, $contact_last6, $email, 'visitor_phone', 'visitor_email') ?? 'N/A',
                'marketing_notch_chat_dump' => $this->findMatchingRecord($_Marketing_Notch_Dump, $contact_last6, $email, 'visitor_phone', 'visitor_email') ?? 'N/A',
                'web_form' => $this->findMatchingRecord($_Brand_Leads, $contact_last6, $email, 'phone', 'email') ?? 'N/A',
                'lead_data' => $this->findMatchingRecord($_Leads_Data, $contact_last6, $email, 'phone', 'email') ?? 'N/A',
                'invoice' => $invoice,
                'is_matched' => true
            ];

            $processedInvoices[] = $uniqueKey; // Mark invoice as processed
        }

        return $_data;
    }

    private function fetchUnmatchedData($_data)
    {
        $_unmatched_data = [];
        // Fetch unmatched data logic here
        return $_unmatched_data;
    }

    private function findMatchingRecord($collection, $contact_last6, $email, ...$columns)
    {
        foreach ($collection as $item) {
            foreach ($columns as $column) {
                if ((isset($item->$column) && substr($item->$column, -6) === $contact_last6) || (isset($item->email) && $item->email === $email)) {
                    return $item;
                }
            }
        }
        return null;
    }

    // Store lead
    public function store(Request $request)
    {
        // dd($request->all());

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'source' => 'required',
            'brand_id' => 'required',
        ]);


        $lead = new LeadsData();
        $lead->lead_no = "Lead# " . $this->generateLeadNo();
        $lead->name = $request->name;
        $lead->email = $request->email;
        $lead->phone = $request->phone;
        $lead->source = $request->source;
        $lead->brand_id = $request->brand_id;
        $lead->status = $request->lead_status ?? 'Active';

        $lead->save();

        return response()->json(['success' => 'Lead created successfully']);
    }

    // Update lead
    public function update(StoreLeadRequest $request, $id)
    {
        $lead = LeadsData::findOrFail($id);
        $lead->fill($request->validated());
        $lead->status = $request->status;
        $lead->save();

        return response()->json(['success' => 'Lead updated successfully']);
    }

    // Delete lead
    public function destroy($id)
    {
        $lead = LeadsData::findOrFail($id);
        $lead->delete();

        return response()->json(['success' => 'Lead deleted successfully']);
    }

    public function detailView($contact)
    {
        $contact = preg_replace('/[ \,\.\-\(\)\+\s]/', '', $contact);

        $invoices = Invoice::with('brands')->whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(contact, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();
        $callLogs = TelnyxCallLog::whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cld, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->orWhereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cli, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();
        $designnesChats = DesignnesChatDump::whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(visitor_phone, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();
        $marketingNotchChats = MarketingNotchChatDump::whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(visitor_phone, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();
        $webForms = BrandLeads::whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(phone, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();
        $leadData = LeadsData::whereRaw("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(phone, ' ', ''), '-', ''), '(', ''), ')', ''), '.', ''), '+', '') LIKE ?", ["%$contact%"])->get();

        return view('leads.details', compact('invoices', 'callLogs', 'designnesChats', 'marketingNotchChats', 'webForms', 'leadData'));
    }

    public function getBrandAPIData()
    {

        $latestRecord = DB::table('brand_leads')->orderBy('id', 'DESC')->first();
        $latestId = $latestRecord ? $latestRecord->id : 0;

        $apiUrl = 'https://securepay.designtechpro.com/brand-leads-api';
        $apiToken = env('BRAND_API_TOKEN');        

        // Construct API URL with latest ID as a query parameter
        $urlWithParams = $apiUrl . '?latest_id=' . $latestId;

        // Initialize cURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $urlWithParams);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'X-API-TOKEN: ' . $apiToken,
            'Accept: application/json',
        ]);

        // Execute cURL request
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        if ($response === false) {
            return response()->json(['error' => 'Failed to fetch data', 'curl_error' => $curlError], 500);
        }

        $data = json_decode($response, true);

        if ($httpCode !== 200 || !isset($data['success']) || !$data['success']) {
            return response()->json(['error' => 'API request failed', 'status' => $httpCode, 'response' => $data], $httpCode);
        }

        // Insert new records
        foreach ($data['data'] as $record) {
            DB::table('brand_leads')->insert([
                'id'                  => $record['id'], // Store the API's id
                'brand_name'          => $record['brand_name'],
                'name'                => $record['name'],
                'email'               => $record['email'],
                'phone'               => $record['phone'],
                'service'             => $record['service'],
                'message'             => $record['message'],
                'url'                 => $record['url'],
                'ip_address'          => $record['ip_address'],
                'city'                => $record['city'],
                'country'             => $record['country'],
                'internet_connection' => $record['internet_connection'],
                'zipcode'             => $record['zipcode'],
                'region'              => $record['region'],
                'created_at'          => $record['created_at'],
                'updated_at'          => $record['updated_at'],
            ]);
        }

        return response()->json(['message' => 'Data fetched and stored successfully', 'new_records' => count($data['data'])]);
    }
}