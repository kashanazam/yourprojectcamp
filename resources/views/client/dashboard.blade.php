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
    <div class="col-lg-4 col-md-4 mb-4">
        <div class="card mb-4">
            <div class="display-date">
                <span id="day">day</span>,
                <span id="daynum">00</span>
                <span id="month">month</span>
                <span id="year">0000</span>
            </div>
            <div class="display-time"></div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    const displayTime = document.querySelector(".display-time");
    // Time
    function showTime() {
    let time = new Date();
    displayTime.innerText = time.toLocaleTimeString("en-US", { hour12: true });
    setTimeout(showTime, 1000);
    }

    showTime();

    // Date
    function updateDate() {
    let today = new Date();

    // return number
    let dayName = today.getDay(),
        dayNum = today.getDate(),
        month = today.getMonth(),
        year = today.getFullYear();

    const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
    ];
    const dayWeek = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ];
    // value -> ID of the html element
    const IDCollection = ["day", "daynum", "month", "year"];
    // return value array with number as a index
    const val = [dayWeek[dayName], dayNum, months[month], year];
    for (let i = 0; i < IDCollection.length; i++) {
        document.getElementById(IDCollection[i]).firstChild.nodeValue = val[i];
    }
    }

    updateDate();

</script>
@endpush