@extends('layouts.app-admin')
@push('styles')
<style>
    .ul-widget2__username {
       font-size: 0.8rem;
    }
    .ul-widget4__actions {flex: 0 0 220px;}
</style>
@endpush
@section('content')

<div class="breadcrumb">
    <h1 class="mr-2">Messages</h1>
</div>
<div class="separator-breadcrumb border-top"></div>

<div class="row mb-4">
    <div class="col-md-12">
        <div class="card text-left">
            <div class="card-body">
                <form action="{{ route('admin.message') }}" method="GET">
                    <div class="row">
                        <div class="col-md-3 form-group mb-3">
                            <label for="brand">Search By Brand</label>
                            <select name="brand" id="brand" class="form-control select2">
                                <option value="">Select Brand</option>
                                @foreach($brands as $key => $value)
                                <option value="{{ $value->id }}" {{ Request::get('brand') ==  $value->id ? 'selected' : ' '}}>{{ $value->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 form-group mb-3">
                            <label for="message">Search By Message</label>
                            <input type="text" class="form-control" id="message" name="message" value="{{ Request::get('message') }}">
                        </div>
                        <div class="col-md-3 form-group mb-3">
                            <label for="client_name">Search By Client</label>
                            <input class="form-control" type="text" name="client_name" id="client_name" value="{{ Request::get('client_name') }}">
                        </div>
                        <div class="col-md-12">
                            <div class="text-right">
                                <button class="btn btn-primary">Search Result</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<section class="widgets-content">
    <!-- begin::users-->
    <div class="row mt-2">
        <div class="col-xl-12">
            @foreach($data as $key => $value)
            <div class="card mb-4">
                <div class="card-body">
                    <div class="ul-widget__body">
                        <div class="tab-content pt-0 pb-0">
                            <div class="tab-pane active show">
                                <div class="ul-widget1">
                                    <div class="ul-widget4__item ul-widget4__users">
                                        <div class="ul-widget4__img">
                                            <img id="userDropdown" src="{{ asset('newglobal/images/no-user-img.jpg') }}" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                                        </div>
                                        <div class="ul-widget2__info ul-widget4__users-info">
                                            <a class="ul-widget2__title" href="">{{ $value->name }} {{ $value->last_name }} - <span>{{ $value->email }}</span> <span class="badge badge-primary">{{ Request('message')}} {{ date('h:i A d, M Y', strtotime($value->created_at)) }}</span></a>
                                            <span class="ul-widget2__username" href="#">
                                                {!! \Illuminate\Support\Str::limit(preg_replace("/<\/?a( [^>]*)?>/i", "", strip_tags($value->message)), 300, $end='...') !!}
                                            </span>
                                        </div>
                                        <div class="ul-widget4__actions text-center">
                                            <div class="d-flex">
                                                <a href="{{ route('admin.message.show', [ 'id' => $value->user_id, 'name' => strtolower($value->name) . '-' . strtolower($value->last_name)]) }}" class="btn btn-outline-success mr-2">Message Details</a>
                                                <a href="{{ route('admin.client.show', $value->client_id) }}" class="btn btn-primary">Client Details</a>
                                            </div>
                                            <span class="badge badge-info">{{ $value->brand_name }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    <!-- end::users-->
</section>
@endsection

@push('scripts')
@endpush