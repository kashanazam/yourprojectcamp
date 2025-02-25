<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BrandLeads;
use App\Models\DesignnesChatDump;
use App\Models\LeadsData;
use App\Models\Brand;
use App\Models\Client;
use App\Models\Invoice;
use App\Models\MarketingNotchChatDump;
use App\Models\TelnyxCallLog;

class DataBankController extends Controller
{
    public function telnyx_call_log(Request $request)
    {
        $telnyx_call_logs = TelnyxCallLog::orderBy('id', 'desc')->get();
        return view('data-bank.telnyx-call-log', compact('telnyx_call_logs'));   
    }

    public function ringCentral_call_log(Request $request)
    {
        // $ringCentral_call_logs = RingCentralCallLog::orderBy('id', 'desc')->get();
        // return view('data-bank.ringCentral-call-log', compact('ringCentral_call_logs'));
    }

    public function designnes_chat(Request $request)
    {
        $designnes_chat = DesignnesChatDump::orderBy('id', 'desc')->get();
        return view('data-bank.designnes-chat', compact('designnes_chat'));
    }

    public function marketingNotch_chat(Request $request)
    {
        $marketingNotch_chat = MarketingNotchChatDump::orderBy('id', 'desc')->get();
        return view('data-bank.marketingNotch-chat', compact('marketingNotch_chat'));
    }

    public function webForms(Request $request)
    {
        $webForms = BrandLeads::orderBy('id', 'desc')->get();
        return view('data-bank.web-forms', compact('webForms'));
    }
}
