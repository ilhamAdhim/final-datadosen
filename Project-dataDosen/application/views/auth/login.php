<!doctype html>
<html lang="en">

<head>
    <title> Login </title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/css/style.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/css/mdb.min.css" rel="stylesheet">

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 min-vh-100 d-flex flex-column justify-content-center">
                <div class="row">
                    <div class="col-lg-6 col-md-8 mx-auto">

                        <!-- form card login -->
                        <div class="card rounded shadow shadow-sm">
                            <div class="card-header">
                                <h3 class="mb-0">Login</h3>
                            </div>
                            <div class="card-body">
                                <?= form_open('auth/proses_login');?>
                                <form class="form" role="form" autocomplete="off" id="formLogin" novalidate=""
                                    method="POST">
                                    <div class="md-form">
                                        <input type="text" id="inputMDEx" class="form-control" name="uname1"
                                            id="uname1" required>
                                        <label for="inputMDEx">Username</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

                                    <div class="md-form">
                                        <input type="password" id="inputMDEx2" class="form-control"  name="pwd1" id="pwd1" required="">
                                        <label for="inputMDEx2">Password</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

                                    <span class="custom-control-description small text-dark">Don't have an
                                        account ?</span>
                                    <a href="<?=base_url();?>auth/register">
                                        Register
                                    </a>
                                        
                                    <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">
                                        <span>
                                        <i class="fa fa-lock mr-2" aria-hidden="true"></i>
                                        </span>
                                        Login
                                    </button>

                                </form>
                                <?= form_close();?>

                            </div>

                            <!--/card-block-->
                        </div>
                        <?php if (isset($pesan)) { ?>
                        <div class="alert alert-danger" role="alert">
                            <?=$pesan?>
                        </div>
                        <?php }else{ ?>
                        <div class="alert alert-info">
                            <?="Input your username and password"?>
                        </div>
                        <?php } ?>
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
    <script src="<?=base_url()?>assets/js/popper.js"></script>
    <script src="<?=base_url()?>assets/js/bootstrap.min.js"></script>
    <script src="<?=base_url()?>assets/js/main.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/js/mdb.min.js"></script>


</body>

</html>