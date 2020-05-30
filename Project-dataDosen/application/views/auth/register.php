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

		<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/css/style.css"/>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/css/mdb.min.css" rel="stylesheet">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
							<?php if(validation_errors()):?>
								<div class="alert alert-danger" role="alert">
									<?=validation_errors()?>
								</div>
							<?php endif?>
													
								<form action="" method="post">

								<div class="md-form">
                                        <input type="text" id="inputMDEx" class="form-control"  name="nm"required>
                                        <label for="inputMDEx">Codename</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

									<div class="md-form">
                                        <input type="text" id="inputMDEx" class="form-control" type="email" name="email" required>
                                        <label for="inputMDEx">Email</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

									<div class="md-form">
                                        <input type="text" id="inputMDEx" class="form-control" name="uname1" required>
                                        <label for="inputMDEx">Username</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

									<div class="md-form">
                                        <input type="password" id="inputMDEx" class="form-control" type="password" name="pwd1" required>
                                        <label for="inputMDEx">Password</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

									<div class="md-form">
                                        <input type="password" id="inputMDEx" class="form-control" name="uname1"required>
                                        <label for="inputMDEx">Re-enter Password</label>
                                        <div class="invalid-feedback">Oops, you missed this one.</div>
                                    </div>

									<div class="form-group container">
										<div class="row">
											<div class="col-sm-5">
												<center>
												<!-- <div class="carousel-caption ml-5" style="margin-bottom:-25px;">
													Lecturer
												</div> -->
												<input required type="radio" name="identity" id="lecturer" value="lecturer"/>
												LECTURER
												<!-- <label for="lecturer">
													<img src="<?=base_url()?>assets/images/admin.jpg" height=100px width=180px alt="">
												</label> -->
												</center>
											</div>
											<div class="col-sm-5" style="margin-left:2em;">
												<center> 
												<!-- <div class="ml-6" style="margin-bottom:-25px;">
													Admin
												</div> -->
												<input required type="radio" name="identity" id="admin" value="admin"/>
												ADMIN
												<!-- <label for="admin">
												<img src="<?=base_url()?>assets/images/dosen.jpg" height=100px width=180px alt="">
												</label> -->
												</center>
											</div>
										</div>
									</div>
									<span class="custom-control-description small text-dark">Have an account ?</span>
                                      <a href="<?=base_url();?>">Login</a>

									<button type="submit" name="submit" class="btn btn-success btn-block">
										 Register</button>
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
    <script src="<?=base_url()?>assets/js/popper.js"></script>
    <script src="<?=base_url()?>assets/js/bootstrap.min.js"></script>
    <script src="<?=base_url()?>assets/js/main.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/js/mdb.min.js"></script>

</body>

</html>