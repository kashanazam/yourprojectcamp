@extends('layouts.app-support')
@push('styles')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="{{ asset('newglobal/css/image-uploader.min.css') }}">
<link rel="stylesheet" href="{{ asset('global/css/fileinput.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.css" integrity="sha512-jU/7UFiaW5UBGODEopEqnbIAHOI8fO6T99m7Tsmqs2gkdujByJfkCbbfPSN4Wlqlb9TGnsuC0YgUgWkRBK7B9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    .ul-widget2__username {
       font-size: 0.8rem;
    }
    button.write-message {
        margin-bottom: 30px;
    }
    .ul-widget3-body p {margin-bottom: 4px;}

    .loader {
        text-align: center;
        display: none;
    }

    .loader img {
        width: 30px;
    }
</style>
@endpush
@section('content')
<div class="breadcrumb row">
    <div class="col-md-6">
        <h1>Messages</h1>
        <ul>
            <li><a href="#">{{ $user->name }} {{ $user->last_name }} | {{ $user->email }}</a></li>
        </ul>
    </div>
    <div class="col-md-6 text-right">
        <!-- <a href="{{ route('manager.message') }}" class="btn btn-primary">Back</a> -->
    </div>
</div>

<div class="separator-breadcrumb border-top"></div>
<section class="widgets-content">
    <!-- begin::users-->
    <div class="row">
        <div class="col-md-12 text-right">
            <button class="btn btn-primary ml-auto write-message">Write A Message</button>
        </div>
    </div>
</section>
<section id="basic-form-layouts" class="support-message-box-wrapper">
    <div class="row">
        <div class="col-md-8 message-box-wrapper message-box-wrapper-{{ $user->id }}" id="message-box-wrapper">
        @foreach($messages->sortBy('id') as $message)
            <div class="card mb-3 {{ $message->role_id == Auth()->user()->is_employee ? 'left-card' : 'right-card' }}">
                <div class="card-body">
                    <div class="card-content collapse show">
                        <div class="ul-widget__body mt-0">
                            <div class="ul-widget3 message_show">
                                <div class="ul-widget3-item mt-0 mb-0">
                                    <div class="ul-widget3-header">
                                        <div class="ul-widget3-info">
                                            <a class="__g-widget-username" href="#">
                                                <span class="t-font-bolder">{{ $message->user->name }} {{ $message->user->last_name }}</span>
                                            </a>
                                        </div>
                                        @if($message->user_id == Auth()->user()->id)
                                        <button class="btn-sm btn btn-primary" onclick="editMessage({{$message->id}})">Edit Message</button>
                                        @endif
                                    </div>
                                    <div class="ul-widget3-body">
                                        {!! nl2br($message->message) !!}
                                        <span class="ul-widget3-status text-success t-font-bolder text-right">
                                            {{ date('h:m a - d M, Y', strtotime($message->created_at)) }}
                                        </span>
                                    </div>
                                    <div class="file-wrapper">
                                        @if(count($message->sended_client_files) != 0)
                                        @foreach($message->sended_client_files as $key => $client_file)
                                        <ul>
                                            <li>
                                                <button class="btn btn-dark btn-sm">{{++$key}}</button>
                                            </li>
                                            <li>
                                                @if(($client_file->get_extension() == 'jpg') || ($client_file->get_extension() == 'png') || (($client_file->get_extension() == 'jpeg')))
                                                <a href="{{ $client_file->generatePresignedUrl() }}" target="_blank">
                                                    <img src="{{ $client_file->generatePresignedUrl() }}" alt="{{$client_file->name}}" width="40">
                                                </a>
                                                @else
                                                <a href="{{ $client_file->generatePresignedUrl() }}" target="_blank">
                                                    {{$client_file->name}}.{{$client_file->get_extension()}}
                                                </a>
                                                @endif
                                            </li>
                                            <li>
                                                <a href="{{ $client_file->generatePresignedUrl() }}" target="_blank">{{$client_file->name}}</a>
                                            </li>
                                            <li>
                                                <a href="{{ $client_file->generatePresignedUrl() }}" target="_blank" download>Download</a>
                                            </li>
                                        </ul>
                                        @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($message->receiver_seen == 0)
                        <i class="fa-solid fa-check fa-not-seen"></i>
                        @else
                        <i class="fa-solid fa-check-double fa-seen"></i>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
            <div class="pt-3 pb-3 chat-input-area d-none">
                <form class="inputForm">
                    <div class="form-group">
                        <textarea class="form-control form-control-rounded" placeholder="Type your message" cols="30" rows="3"></textarea>
                    </div>
                    <div class="d-flex">
                        <div class="flex-grow-1"></div>
                        <button class="btn btn-icon btn-rounded btn-primary me-2">
                        <i class="i-Paper-Plane"></i>
                        </button>
                        <button class="btn btn-icon btn-rounded btn-outline-primary" type="button">
                        <i class="i-Add-File"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4 file-upload">
            <div class="sticky-wrapper">
                <form action="{{ route('support.message.send.chunks') }}" class="dropzone" id="my-awesome-dropzone" enctype="multipart/form-data" method="post">
                    @csrf
                    <input type="hidden" name="message" value="Attachments">
                    <input type="hidden" name="client_id" value="{{ $user->id }}">
                    <input type="file" name="file"  style="display: none;">
                </form>
                <ul id="file-upload-list" class="list-unstyled">

                </ul>
                <ul class="show-image">
                @foreach ($messages->sortByDesc('id') as $key => $value)
                    @foreach ($value->client_files as $file_key => $file_value)
                    <li>
                        <div class="image">
                            <a href="{{ $file_value->generatePresignedUrl() }}" target="_blank" title="{{$file_value->name}}.{{$file_value->get_extension()}}">
                            @if(($file_value->get_extension() == 'jpg') || ($file_value->get_extension() == 'png') || (($file_value->get_extension() == 'jpeg')))
                                <img src="{{ $file_value->generatePresignedUrl() }}" alt="{{$file_value->name}}" width="40">
                            @else
                                <p>{{ $file_value->get_extension() }}</p>
                            @endif
                            </a>
                        </div>
                    </li>
                    @endforeach
                @endforeach
                </ul>
            </div>
        </div>
        <div class="col-md-12 text-right">
            <button class="btn btn-primary ml-auto write-message mb-0">Write A Message</button>
        </div>
    </div>
</section>
<div class="left-message-box-wrapper">
    <div class="left-message-box">
        <form class="form" action="{{ route('support.message.send') }}" enctype="multipart/form-data" method="post" id="message-post">
            @csrf
            <input type="hidden" name="client_id" id="client_id" value="{{ $user->id }}">
            <div class="form-body">
                <div class="form-group mb-0">
                    <h1>Write A Message <span id="close-message-left"><i class="nav-icon i-Close-Window"></i></span></h1>
                    <textarea id="message" rows="8" class="form-control border-primary" name="message" required placeholder="Write a Message">{{old('message')}}</textarea>
                    <div class="input-field">
                        <div class="input-images" style="padding-top: .5rem;"></div>
                    </div>
                    <div class="form-actions pb-0">
                        <button type="submit" class="btn btn-primary w-100">
                        <i class="la la-check-square-o"></i> Send Message
                        </button>
                        <div class="loader">
                            <img src="{{ asset('newglobal/images/loader.gif') }}" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>        
</div>
<!--  Modal -->
<div class="modal fade" id="exampleModalMessageEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-2">Edit Message</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <form action="{{ route('support.message.update') }}" method="post">
                @csrf
                <input type="hidden" name="message_id" id="message_id">
                <div class="modal-body">
                    <textarea name="editmessage" id="editmessage" cols="30" rows="10" class="form-control"></textarea> 
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary ml-2" type="submit">Update changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js" integrity="sha512-OF6VwfoBrM/wE3gt0I/lTh1ElROdq3etwAquhEm2YI45Um4ird+0ZFX1IwuBDBRufdXBuYoBb0mqXrmUA2VnOA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="{{ asset('global/js/fileinput.js') }}"></script>
<script src="{{ asset('global/js/fileinput-theme.js') }}"></script>
<script src="{{ asset('newglobal/js/image-uploader.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.js" integrity="sha512-U2WE1ktpMTuRBPoCFDzomoIorbOyUv0sP8B+INA3EzNAhehbzED1rOJg6bCqPf/Tuposxb5ja/MAUnC8THSbLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(document).ready(function(){
        $('.input-images').imageUploader();
        document.getElementById('message-box-wrapper').scrollIntoView({ behavior: 'smooth', block: 'end' });
    });
    CKEDITOR.replace('editmessage');
    CKEDITOR.replace('message');
    function editMessage(message_id){
        var url = "{{ route('support.message.edit', ":message_id") }}";
        url = url.replace(':message_id', message_id);
        $.ajax({
            type:'GET',
            url: url,
            success:function(data) {
                if(data.success){
                    CKEDITOR.instances['editmessage'].setData(data.data.message);
                    $('#exampleModalMessageEdit').find('#message_id').val(data.data.id);
                    $('#exampleModalMessageEdit').modal('toggle');
                }
            }
        });
    }
     $(document).ready(function(){
        $('.write-message').click(function(){
            $('.left-message-box-wrapper').addClass('fixed-option');
        });
        $('#close-message-left').click(function(){
            $('.left-message-box-wrapper').removeClass('fixed-option');
        })
    });
</script>
<script>
g_FileUploadControlCounter = 0;

function Clicked_h_btnAddFileUploadControl() {
    var v_btnFileUploadControl = document.getElementById("h_btnAddFileUploadControl");  
        v_btnFileUploadControl.value = "Add Another Attachment";

    var n="h_Item_Attachments_FileInput[]";
    var z="h_Item_Attachment" + g_FileUploadControlCounter;
    var x = document.createElement("INPUT");

        x.setAttribute("type", "file");
        x.setAttribute("id", z);
        x.setAttribute("name", n);
        x.setAttribute("onchange", "UpdateAttachmentsDisplayList()");
        x.setAttribute("class", "Otr_Std_pad");
        document.getElementById("h_ItemAttachmentControls").appendChild(x);
        g_FileUploadControlCounter++;
    }

    function Clicked_h_hrefRemoveFileUploadControl(v_Item_Attachment) {

        document.getElementById(v_Item_Attachment.id).value = null;
        UpdateAttachmentsDisplayList();
    }

    function UpdateAttachmentsDisplayList() {

    var inputs = document.getElementsByTagName('input');
    var txt='';

    for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].type.toLowerCase() == 'file') {
            if(inputs[i].value.length > 0)
            {
                var x = inputs[i];
                txt += "<div class='item-attachments-wrapper'><strong>" + inputs[i].value + "</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:Clicked_h_hrefRemoveFileUploadControl(" + x.id + ");'>Delete</a></div>";
                document.getElementById(inputs[i].id).style.visibility = "hidden";
                document.getElementById(inputs[i].id).style.height = "0";
                document.getElementById(inputs[i].id).style.width = "0";
            }else{
                document.getElementById(inputs[i].id).style.visibility = "visible";
            }
        }
        document.getElementById("h_ItemAttachments").innerHTML = txt;
        }
    }

    $('#message-post').submit(function(){
        $(this).find('.loader').show();
        $(this).find('.btn-primary').hide();
    });

    $("#image-file").fileinput({
        showUpload: true,
        elErrorContainer: '#kartik-file-errors',
        theme: 'fa',
        dropZoneEnabled : true,
        uploadUrl: "{{ route('support.message.send') }}",
        overwriteInitial: false,
        maxFileSize:20000000,
        enableResumableUpload: true,
        maxFilesNum: 20,
        resumableUploadOptions: {
            testUrl: "{{ route('support.message.send.chunks') }}",
            chunkSize: 1024, // 1 MB chunk size
        },
        uploadExtraData: function() {
            return {
                client_id: $('#client_id').val(),
                message: 'Attachments'
            };
        }
    });
    $("#image-file").on('fileuploaded', function(event, data, previewId, index, fileId) {
        var response = data.response;
        console.log(response)
    });
</script>
<script>
    // Dropzone
    var $ = window.$; // use the global jQuery instance

if ($("#my-awesome-dropzone").length > 0) {
    var token = $('input[name=_token]').val();

    // A quick way setup
    var myDropzone = new Dropzone("#my-awesome-dropzone", {
        // Setup chunking
        chunking: true,
        method: "POST",
        maxFilesize: 1000000000,
        chunkSize: 5000000,
        // If true, the individual chunks of a file are being uploaded simultaneously.
        parallelChunkUploads: true
    });

    var $list = $('#file-upload-list');

    myDropzone.on('sending', function (file, xhr, formData) {
        formData.append("_token", token);
        formData.append("client_id", $('#client_id').val());
        formData.append("message", $("input[name='message']").val());
        var dropzoneOnLoad = xhr.onload;
        xhr.onload = function (e) {
            dropzoneOnLoad(e)
            var uploadResponse = JSON.parse(xhr.responseText)
            if (typeof uploadResponse.data.original.name === 'string') {
                var inner_html = '';
                if((uploadResponse.extension == 'jpg') || (uploadResponse.extension == 'png') || ((uploadResponse.extension == 'jpeg'))){
                    inner_html = '<img src="'+uploadResponse.url+'" alt="'+uploadResponse.data.original.actual_name+'" width="40">';
                }else{
                    inner_html = '<p>'+ uploadResponse.extension +'</p>';
                }
                $('.show-image').prepend('<li>\
                        <div class="image">\
                            <a href="'+uploadResponse.url+'" target="_blank" title="'+ uploadResponse.data.original.actual_name + '.' + uploadResponse.extension+'">'+inner_html+'</a>\
                        </div>\
                    </li>');
                $list.html('<li>Uploaded Successfully</li>')
                myDropzone.removeAllFiles();
            }
        }
    })

    // THIS IS FOR INTEGRATION TESTS - DO NOT USE

    // Process the query when file is added to the input
    $('input[name=file]').on('change', function () {
        if (typeof this.files[0] === 'object') {
            myDropzone.addFile(this.files[0]);
        }
    });

    myDropzone.on('addedfile', function () {
        $list.append('<li>Uploading</li>')
    })
}
var message_channel = pusher.subscribe('private.{{ Auth::user()->id }}-{{ $user->id }}');
message_channel.bind('seenmessage', function(data) {
    $('.card-content > i.fa-check').removeClass('fa-check fa-not-seen').addClass('fa-check-double fa-seen');
    console.log(data);
});
</script>
@endpush