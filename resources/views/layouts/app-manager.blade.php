<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name') }} - @yield('title')</title>
    <link rel="apple-touch-icon" sizes="57x57" href="{{ asset('global/img/apple-icon-57x57.png') }}">
    <link rel="apple-touch-icon" sizes="60x60" href="{{ asset('global/img/apple-icon-60x60.png') }}">
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('global/img/apple-icon-72x72.png') }}">
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('global/img/apple-icon-76x76.png') }}">
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('global/img/apple-icon-114x114.png') }}">
    <link rel="apple-touch-icon" sizes="120x120" href="{{ asset('global/img/apple-icon-120x120.png') }}">
    <link rel="apple-touch-icon" sizes="144x144" href="{{ asset('global/img/apple-icon-144x144.png') }}">
    <link rel="apple-touch-icon" sizes="152x152" href="{{ asset('global/img/apple-icon-152x152.png') }}">
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('global/img/apple-icon-180x180.png') }}">
    <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('global/img/android-icon-192x192.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('global/img/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="96x96" href="{{ asset('global/img/favicon-96x96.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('global/img/favicon-16x16.png') }}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{ asset('global/img/ms-icon-144x144.png') }}">
    <meta name="theme-color" content="#ffffff">
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/lite-purple.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/perfect-scrollbar.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/toastr.css') }}" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/datatables.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/select2.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('newglobal/css/sweetalert2.min.css') }}" rel="stylesheet" />
    @stack('styles')
    <style>
        .select2-container .select2-selection--single {
            height: 34px;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: #444;
            line-height: 31px;
            background-color: #f8f9fa;
        }

        .select2-container--default .select2-selection--single {
            background-color: transparent;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        a.brands-list {
            margin-left: 20px;
        }

        a.brands-list {
            font-size: 18px;
            font-weight: bold;
            color: #0076c2;
        }

        a.brands-list span {
            border-right: 2px solid rgba(102, 51, 153, 0.1);
            padding-right: 10px;
            margin-right: 9px;
        }

        a.brands-list span:last-child {
            border: 0;
        }
    </style>
</head>

<body class="text-left">
    @if (Session::get('valid_user'))
        <div class="app-admin-wrap layout-sidebar-large">
            @include('inc.manager-nav')
            <div class="main-content-wrap sidenav-open d-flex flex-column">
                <div class="main-content">
                    @yield('content')
                </div>
                <div class="flex-grow-1"></div>
                <div class="app-footer">
                    <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center">
                        <span class="flex-grow-1"></span>
                        <div class="d-flex align-items-center">
                            <img class="logo" src="{{ asset('global/img/sidebarlogo.png') }}" alt="">
                            <div>
                                <p class="m-0">&copy; <?php echo date('Y'); ?> {{ config('app.name') }}</p>
                                <p class="m-0">All rights reserved</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="auth-layout-wrap">
            <div class="auth-content">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card o-hidden">
                            <div class="p-5">
                                <div class="auth-logo text-center mb-4">
                                    <img src="{{ asset('global/img/logo.png') }}" alt="{{ config('app.name') }}">
                                </div>
                                <h1 class="mb-3 text-18" style="line-height: 25px;">Verification Code has been send to
                                    Email Address: s4s.m*****@gmail.com</h1>
                                <span>Current Ip: {{ Session::get('ip_address') }}</span>
                                <form class="form-horizontal form-simple" action="{{ route('verify.code') }}"
                                    method="post">
                                    @csrf
                                    <div class="form-group">
                                        <label for="code">Verification code</label>
                                        <input type="text"
                                            class="form-control form-control-rounded @error('code') is-invalid @enderror"
                                            name="code" id="code" required value="{{ old('code') }}"
                                            autofocus>
                                        @if (\Session::has('code'))
                                            <span class="invalid-feedback d-block" role="alert">
                                                <strong>{!! \Session::get('error') !!}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <button class="btn btn-rounded btn-primary btn-block mt-2" type="submit">Verify
                                        it's you</button>
                                    <div class="mt-3 text-center">
                                        <a href="{{ route('logout') }}" class="text-muted"
                                            onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                                            <u>Sign out</u>
                                        </a>
                                    </div>
                                </form>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    style="display: none;">
                                    @csrf
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

    <!--  Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle-2"> Payment Information </h5>
                </div>
                <div class="modal-body">
                    {{-- <h5 class="mb-1 font-weight-bold">Zelle</h5> --}}
                    {{-- <p class="mb-0">finance@designared.com</p> --}}
                    {{-- <hr class="mt-3 mb-3">
                    <h5 class="mb-1 font-weight-bold">Cash app</h5> --}}
                    {{-- <p class="mb-0">finance@designared.com</p> --}}
                    {{-- <hr class="mt-3 mb-3"> --}}
                    <h5 class="mb-1 font-weight-bold">Wire</h5>
                    {{-- <p class="mb-2">1. Wells Fargo<br>Designared LLC<br>Account # 5166861889<br>Address: 2000 N Collins Street Arlington Tx 76011</p>
                    <h5 class="mb-1 font-weight-bold">Routing & balance info</h5>
                    <p>Account number 5166861889<br>Direct deposite & electronic payments 111900659<br>Domestic wire transfers 121000248<br>International wire transfers WFBIUS6S</p>
                     --}}
                    <p class="mb-2">1. Bank of America<br>Name: Designared LLC<br>Address: 2800 NE Green oaks BLVD apt 3204 Grand prairie, TX 75050<br>Routing Number: 111000025 (wires-Use this routing number for all incoming wire transfers)<br>Checking Account: 4881 2438 5870</p>
                    {{-- <p class="mb-2">2. Bank of america<br>Name: RaptorApps LLC<br>Address: 738 Fawn Valley Dr, Allen, TX, 75002<br>Routing Number: 026009593 (wires-Use this routing number for all incoming wire transfers)<br>Checking Account: 488123347657+</p> --}}
                </div>
            </div>
        </div>
    </div>
    <!--  Verify Modal content -->
    <script src="{{ asset('newglobal/js/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/script.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/sidebar.large.script.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/echarts.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/echart.options.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/datatables.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/toastr.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/select2.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/Chart.min.js') }}"></script>
    <script src="{{ asset('newglobal/js/sweetalert2.min.js') }}"></script>
    @yield('script')

    @stack('scripts')
    @if (session()->has('success'))
        <script>
            var timerInterval;
            swal({
                type: 'success',
                title: 'Success!',
                text: "{{ session()->get('success') }}",
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success',
                timer: 2000
            });
        </script>
    @endif
    <script>
        @if (count($errors) > 0)
            @foreach ($errors->all() as $error)
                toastr.error("{{ $error }}", {
                    timeOut: "50000"
                });
            @endforeach
        @endif
    </script>
    <script>
        if ($('#zero_configuration_table').length != 0) {
            $('#zero_configuration_table').DataTable({
                order: [
                    [0, "desc"]
                ],
                responsive: true,
            });
        }

        if ($('.select2').length != 0) {
            $('.select2').select2();
        }
    </script>
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        setInterval(() => {
            $.ajax({
                type: 'POST',
                url: "{{ url('keep-alive') }}",
                success: function(data) {
                    console.log(data);
                }
            });
        }, 1200000)
    </script>
    <script>
        $(document).ready(function() {
            $('#dropdownNotification').click(function() {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: "{{ route('mark.notification') }}",
                    success: function(data) {
                        console.log(data);
                    }
                });
            });
        });
    </script>

    {{-- PUSHER NOTIFICATION --}}
    <script src="https://js.pusher.com/7.0/pusher.min.js"></script>
    <script>
        if (!window.Notification) {
            console.log('Browser does not support notifications.');
        } else {
            // check if permission is already granted
            if (Notification.permission === 'granted') {
                // show notification here
            } else {
                // request permission from user
                Notification.requestPermission().then(function(p) {
                    if (p === 'granted') {
                        // show notification here
                    } else {
                        console.log('User blocked notifications.');
                    }
                }).catch(function(err) {
                    console.error(err);
                });
            }
        }

        Pusher.logToConsole = true;
        var pusher = new Pusher('{{ env('PUSHER_APP_KEY') }}', {
            cluster: 'ap2',
            authEndpoint: '/broadcasting/auth',
            auth: {
                headers: {
                    'X-CSRF-Token': '{{ csrf_token() }}',
                },
            }
        });
        var channel = pusher.subscribe('private.{{ Auth::user()->id }}');
        channel.bind('send-event', function(data) {
            console.log('manager')
            console.log('send-event')
            console.log(data)
            if (!window.Notification) {
                console.log('Browser does not support notifications.');
            } else {
                // check if permission is already granted
                if (Notification.permission === 'granted') {
                    var notify = new Notification(data.title, {
                        body: data.message,
                        icon: '{{ asset('icons') }}/' + data.image,
                    });
                    notify.onclick = function(event) {
                        event.preventDefault();
                        window.open(data.link, '_blank');
                    }
                } else {
                    // request permission from user
                    Notification.requestPermission().then(function(p) {
                        if (p === 'granted') {
                            // show notification here
                        } else {
                            console.log('User blocked notifications.');
                        }
                    }).catch(function(err) {
                        console.error(err);
                    });
                }
            }

        });

        channel.bind('send-lead-notifiction', function(response) {
            console.log('manager')
            console.log('send-lead-notifiction')
            console.log(response)
            if (!window.Notification) {
                console.log('Browser does not support notifications.');
            } else {
                if (Notification.permission === 'granted') {
                    var notify = new Notification(response.title, {
                        body: response.message,
                        icon: '{{ asset('icons') }}/' + response.image,
                    });
                    notify.onclick = function(event) {
                        event.preventDefault();
                        window.open(response.link, '_blank');
                    }
                } else {
                    // request permission from user
                    Notification.requestPermission().then(function(p) {
                        if (p === 'granted') {
                            // show notification here
                        } else {
                            console.log('User blocked notifications.');
                        }
                    }).catch(function(err) {
                        console.error(err);
                    });
                }
            }

        });

        $('#bank-info').click(function(){
            $('#exampleModalCenter').modal('toggle');
        })
    </script>
</body>

</html>
