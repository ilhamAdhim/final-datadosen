<!doctype html>
<html lang="en">

<head>
    <title>Register</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/css/mdb.min.css" rel="stylesheet">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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

                        <!-- form card Register -->
                        <div class="card rounded shadow shadow-sm">
                            <div class="card-header">
                                <h3 class="mb-0">Register</h3>
                            </div>
                            <div class="card-body">

                            <form method="POST" action="{{ route('register') }}">
                                @csrf

                                    <div class="md-form">

                                        <input id="code" type="text" class="form-control @error('code') is-invalid @enderror" name="code" value="{{ old('code') }}" required autocomplete="code" autofocus>

                                        <label for="code">{{ __('code') }}</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

                                    <div class="md-form">
                                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                                        <label for="email">Email</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

                                    <div class="md-form">
                                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                        <label for="password">Password</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

                                    <div class="md-form">
                                        <label for="password-confirm" class="form-control">{{ __('Confirm Password') }}</label>
                                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                                    </div>

                                    <span class="custom-control-description small text-dark">Have an account ?</span>
                                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>

                                    <button type="submit" name="submit" class="btn btn-success btn-block">
                                        {{ __('Register') }}
                                    </button>
                                </form>
                            </div>

                            <!--/card-block-->
                        </div>
                        <div class="alert alert-info" role="alert">
                            <?php 
                            if (isset($pesan)) {
								# code...
                                echo $pesan;
                            }else{
								echo "Input your username and password";
                            }
							?>
                        </div>
                        <!-- /form card Register -->
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