@extends('master')

@section('title',"Research Group")

@section('content')

<div class="mb-3">
    <a href="/home" class="btn btn-secondary"> Back to Profile </a>
</div>
<br>

<div class="row mx-auto container">
    <!-- GROUP RESEARCH -->
    <div class="container">
        @if(!empty($research))
            <div class="card-deck">
                @foreach ($research as $gr => $value)
                <!-- Card -->

                <div class="card card-image"
                    style="background-image: url(https://mdbootstrap.com/img/Photos/Horizontal/Work/4-col/img%20%2814%29.jpg);">

                    <!-- Content -->
                    <div class="rgba-black-strong d-flex">
                        <div class="card-body">
                            <div class="text-white py-4 ml-4">

                                <h5 class="blue-text"> <i class="material-icons">computer</i> <b> <?=$value->research?></h5>
                                </b>

                                <p class="text-white card-text pull-right pt-2">Registered as
                                    <strong> <?=$value->priority?></strong> </p>
                            </div>
                        </div>
                    </div>
                    <!-- Card -->
                </div>
                @endforeach
            </div>
        @endif

        @if(sizeof($research) === 0)
        <div class="row">
            <div class="mx-auto">
                <b> You are not included in any group research </b>
            </div>
        </div>
        @endif
        {{-- haeirha --}}
    </div>
</div>



@endsection