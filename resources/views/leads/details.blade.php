@extends('layouts.app-leads-dashboard')
@section('content')


<link href="{{ asset('leadsglobal/libs/admin-resources/rwd-table/rwd-table.min.css') }}" rel="stylesheet"
    type="text/css" />

<!-- preloader css -->
<link rel="stylesheet" href="{{ asset('leadsglobal/css/preloader.min.css') }}" type="text/css" />
<style>
#tech-companies-1 tbody tr td {
    text-transform: capitalize;
    font-size: 10px;
}

.focus-btn-group,
.dropdown-btn-group {
    display: none !important;
}

#add_lead_btn,
#search_lead_btn {
    display: inline-block !important;
}
</style>
@php
function coverDateTime($datetime){
    $input = $datetime;
    $timestamp = strtotime($input);

    return date('m/d/Y h:i:s A', $timestamp);
}
@endphp
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Invoices Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Brand</th>
                                    <th>Invoice#</th>
                                    <th>Amount</th>
                                    <th>Contact</th>
                                    <th>Created</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($invoices as $invoice)
                                <tr>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ $invoice->name }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ $invoice->email }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $invoice->contact) ?? 'N/A' }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ $invoice->brands->name }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ $invoice->invoice_number ?? 'N/A' }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">${{ $invoice->amount ?? 'N/A' }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $invoice->contact) ?? 'N/A' }}</td>
                                    <td style="background: #bb7d3da6;font-weight: 450;color: #fff;">{{ coverDateTime($invoice->created_at) ?? 'N/A' }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                       
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Call Logs (Telnyx)</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Direction</th>
                                    <th>To</th>
                                    <th>From</th>
                                    <th>Duration</th>
                                    <th>Started</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($callLogs as $callLog)
                                <tr>
                                    <td style="background: #4fa843b8;font-weight: 450;color: #fff;">{{ $callLog->direction ?? 'Direction Not Available' }}</td>
                                    <td style="background: #4fa843b8;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $callLog->cld) ?? 'N/A' }}</td>
                                    <td style="background: #4fa843b8;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $callLog->cli) ?? 'N/A' }}</td>
                                    <td style="background: #4fa843b8;font-weight: 450;color: #fff;">{{ gmdate("H:i:s", $callLog->call_sec) }}</td>
                                    <td style="background: #4fa843b8;font-weight: 450;color: #fff;">{{ coverDateTime($callLog->started_at) }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                        
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Designnes Chat Dumps</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Visitor Name</th>
                                    <th>Visitor Phone</th>
                                    <th>Agent Names</th>
                                    <th>Duration</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($designnesChats as $chat)
                                <tr>
                                    <td style="background: #599de1b2;font-weight: 450;color: #fff;">{{ $chat->visitor_name ?? 'N/A' }}</td>
                                    <td style="background: #599de1b2;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $chat->visitor_phone) ?? 'N/A' }}</td>
                                    <td style="background: #599de1b2;font-weight: 450;color: #fff;">{{ $chat->agent_names }}</td>
                                    <td style="background: #599de1b2;font-weight: 450;color: #fff;">{{ gmdate("H:i:s", intval($chat->duration)) }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                  
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Marketing Notch Chat Dumps</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Visitor Name</th>
                                    <th>Visitor Phone</th>
                                    <th>Agent Names</th>
                                    <th>Duration</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($marketingNotchChats as $chat)
                                <tr>
                                    <td style="background: #e68f6db8;font-weight: 450;color: #fff;">{{ $chat->visitor_name ?? 'N/A' }}</td>
                                    <td style="background: #e68f6db8;font-weight: 450;color: #fff;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $chat->visitor_phone) ?? 'N/A' }}</td>
                                    <td style="background: #e68f6db8;font-weight: 450;color: #fff;">{{ $chat->agent_names }}</td>
                                    <td style="background: #e68f6db8;font-weight: 450;color: #fff;">{{ gmdate("H:i:s", intval($chat->duration)) }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Web Forms</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Created</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($webForms as $form)
                                <tr>
                                    <td style="background: #125ea2ab;color: #fff;font-weight: 450;">{{ $form->name ?? 'N/A' }}</td>
                                    <td style="background: #125ea2ab;color: #fff;font-weight: 450;">{{ $form->email ?? 'N/A' }}</td>
                                    <td style="background: #125ea2ab;color: #fff;font-weight: 450;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $form->phone) ?? 'N/A' }}</td>
                                    <td style="background: #125ea2ab;color: #fff;font-weight: 450;">{{ coverDateTime($form->created_at) ?? 'N/A' }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                     
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Leads Data</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mb-0" data-pattern="priority-columns">
                        <table id="tech-companies-1" class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Created</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($leadData as $lead)
                                <tr>
                                    <td style="background:rgba(6, 115, 211, 0.67);color: #fff;font-weight: 450;">{{ $lead->name ?? 'N/A' }}</td>
                                    <td style="background:rgba(6, 115, 211, 0.67);color: #fff;font-weight: 450;">{{ $lead->email ?? 'N/A' }}</td>
                                    <td style="background:rgba(6, 115, 211, 0.67);color: #fff;font-weight: 450;">{{ preg_replace('~.*(\d{3})[^\d]{0,7}(\d{3})[^\d]{0,7}(\d{4}).*~', '($1) $2-$3', $lead->phone) ?? 'N/A' }}</td>
                                    <td style="background:rgba(6, 115, 211, 0.67);color: #fff;font-weight: 450;">{{ coverDateTime($lead->created_at) ?? 'N/A' }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
    <!-- Responsive Table js -->
    <script src="{{ asset('leadsglobal/libs/admin-resources/rwd-table/rwd-table.min.js') }}"></script>
    <!-- Init js -->
    <script src="{{ asset('leadsglobal/js/pages/table-responsive.init.js') }}"></script>
@endpush