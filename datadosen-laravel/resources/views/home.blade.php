@extends('master')

@section('title',"Profile")

@section('content')

<div class="col-lg-4 order-lg-1 mt-4 text-center mb-4">
    <img src="//placehold.it/150" class="mx-auto img-fluid img-circle d-block" alt="avatar">
    <h6 class="mt-4">Upload a different photo</h6>
    <label class="custom-file">
        <input type="file" id="file" class="custom-file-input">
        <span class="custom-file-control btn btn-info">Choose file</span>
    </label>
</div>

<div class="col-lg-8 order-lg-2" id="profile">
    <h5 style="height:1em">{{$info[0]->name}}</h5>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <h6>Codename</h6>
            <p>
                {{$info[0]->code}}
            </p>

            <hr>

            <h6>Status</h6>
            @if($info[0]->status == 'PNS')
            <div class="alert alert-success">
                You are a <b> PNS </b>
            </div>
            @else
            <div class="alert alert-info">
                You are a <b> <?=$info[0]->status?> </b>
            </div>
            @endif

        </div>
        <div class="col-md-6">
            <h6>NIP</h6>
            <p>
                {{$info[0]->NIP ? $info[0]->NIP : 'Not Set' }}
            </p>

            <hr>

            <h6>NIDN</h6>
            <p>
                {{$info[0]->NIDN ? $info[0]->NIDN : 'Not Set'}}
            </p>
        </div>
        <div class="col-md-12">
            <table class="table table-sm table-hover table-striped">
                <tbody>
                    <thead>
                        <th>Position</th>
                        <th>Year</th>
                    </thead>
                    @if(!empty($position))
                    <tr>
                        @if(is_array($position))
                        @foreach($position[0] as $ps => $value)

                        <td> {{$value}}</td>
                        @endforeach

                        @else
                        @foreach ($position as $key => $value) { ?>

                        <td> {{$value->position}} : {{$value->year}} </td>
                        @endforeach
                        @endif

                        @endif
                    </tr>

                    <tr>
                        <td> <strong>Lecturer</strong> in Information Technology Division </td>
                        <td>2019</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container">
        <div class="pull-left">
            <a href="/lecturer/{{$code}}/changePassword" class="btn btn-info"> <b> Change Password</b></a>
        </div>
        <div class="pull-right">
            <a href="/lecturer/{{$code}}/deleteAccount" class="btn btn-danger"> <b> Delete Account</b></a>
        </div>
    </div>

</div>
<!--/row-->
</div>
<!-- end of main container -->
</div>
@endsection