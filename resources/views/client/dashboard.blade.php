@extends('layouts.app-client')
@section('title', 'Dashboard')
@section('content')
<div class="breadcrumb">
    <h1 class="mr-2">Dashboard</h1>
</div>
<div class="separator-breadcrumb border-top"></div>
<div class="row">
    <div class="col-lg-8 col-md-8">
        <!-- CARD ICON-->
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-icon mb-4">
                    <div class="card-body text-center"><i class="i-Speach-Bubble-3"></i>
                        <p class="text-muted mt-2 mb-2">Unread Message</p>
                        <p class="text-primary text-24 line-height-1 m-0">0</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-icon mb-4">
                    <div class="card-body text-center"><i class="i-File-Horizontal-Text"></i>
                        <p class="text-muted mt-2 mb-2">Pending Brief</p>
                        <p class="text-primary text-24 line-height-1 m-0">{{ Auth()->user()->getBriefPendingCount() }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- notification-->
</div>
@endsection
@push('scripts')

@endpush