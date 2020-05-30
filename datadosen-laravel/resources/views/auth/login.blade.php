<!doctype html>
<html lang="en">

<head>
    <title> Login </title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- <link rel="stylesheet" type="text/css" href="../../css/style.css" /> -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/css/mdb.min.css" rel="stylesheet">

</head>

<style>

    body {
        background: url("../../images/loginpage.jpg") no-repeat center center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;

        color: #383e4b;
    }

    h3 {
        font-weight: bolder;
    }

</style>

<body>

<div class="container">
        <div class="row">
            <div class="col-md-12 min-vh-100 d-flex flex-column justify-content-center">
                <div class="row">
                    <div class="col-lg-6 col-md-8 mx-auto">

                        <!-- form card login -->
                        <div class="card rounded shadow shadow-sm">
                            <div class="card-header">
                                <h3 class="mb-0">{{ __('Login') }}</h3>
                            </div>
                            <div class="card-body">
                                
                            <form method="POST" action="{{ route('login') }}">
                                @csrf
                                <div class="md-form">
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                    {{-- <input id="code" type="text" class="form-control @error('code') is-invalid @enderror" name="code" value="{{ old('code') }}" required autocomplete="code" autofocus> --}}
                                    
                                    <label for="email">{{ __('E-Mail Address') }}</label>
                                    
                                    <div class="invalid-feedback">Oops, you missed this one.</div>
                                </div>
                                <div class="md-form">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                                    <label for="password">{{ __('Password') }}</label>
                                    <div class="invalid-feedback">Oops, you missed this one.</div>
                                </div>


                                    <span class="custom-control-description small text-dark">Don't have an
                                        account ? </span>
                                        
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                    
                                    <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">
                                        <span>
                                        <i class="fa fa-lock mr-2" aria-hidden="true"></i>
                                        </span>
                                        {{ __('Login') }}
                                    </button>

                                </form>

                            </div>

                            <!--/card-block-->
                        </div>
                        @if(isset($pesan))
                        <div class="alert alert-danger" role="alert">
                            <?=$pesan?>
                        </div>
                        @else
                        <div class="alert alert-info">
                            <?="Input your username and password"?>
                        </div>
                        @endif
                        <!-- /form card login -->

                    </div>

                </div>
                <!--/row-->

            </div>
            <!--/col-->
        </div>
        <!--/row-->
    </div>
    <!--/container-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../../js/popper.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/main.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/js/mdb.min.js"></script>


</body>

</html>