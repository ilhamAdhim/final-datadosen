<!doctype html>
<html lang="en">

<head>
	<title><?=$title?></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.14.1/css/mdb.min.css" rel="stylesheet">

	<link rel="stylesheet" href="<?=base_url()?>assets/css/stylenavbar.css">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css">
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>


</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" style="background:#244282;min-width:300px;">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i>
					<span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4 pt-5">
				<h1><a href="<?=base_url()?>admin_home" class="logo">JTI</a></h1>
				<ul class="list-unstyled components mb-5">
					<li class="active">
						<a href="<?=base_url()?>adminController/researchGroup"> <i class="fa fa-cogs"
								aria-hidden="true"></i> Research Groups</a>
					</li>
					<li>
						<a href="<?=base_url()?>adminController/Classes"> <i class="fa fa-cubes" aria-hidden="true"></i>
							</i> Classes</a>
					</li>
					<li>
						<a href="#SubjectSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <span>
							<i class="fa fa-book" aria-hidden="true"></i> </span> Subjects
						</a>
					</li>
					<ul class="collapse list-unstyled" id="SubjectSubmenu">
						<li>
							<a href="<?=base_url()?>adminController/subjectsRPSSAP">
								<span>
									<i class="fa fa-file-word-o" aria-hidden="true"></i> 
								</span>
								RPS & SAP
							</a>
						</li>
						<li>
							<a href="<?=base_url()?>adminController/Subjects"> <i class="fa fa-book"
								aria-hidden="true"></i> Subject Details</a>
						</li>
						<li>
							<a href="<?=base_url()?>adminController/lectureContract"> 
							<i class="fa fa-pencil" aria-hidden="true"></i>
							Lecture Contract</a>
						</li>
					</ul>

					<li>

						<a href="#lecSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
							<span> <i class="fa fa-users" aria-hidden="true"></i> </span> Lecturers</a>
						<ul class="collapse list-unstyled" id="lecSubmenu">
							<li>
								<a href="<?=base_url()?>adminController/StatusLecturer">Status</a>
							</li>

							<li>
								<a href="<?=base_url()?>adminController/FieldLecturer">Fields</a>
							</li>

							<li>
								<a href="<?=base_url()?>adminController/PositionLecturer">Position</a>
							</li>

							<li>
								<a href="<?=base_url()?>adminController/DPALecturer">DPA</a>
							</li>

							<li>
								<a href="<?=base_url()?>adminController/ResearchGroupLecturer">Research</a>
							</li>

							<li>
								<a href="<?=base_url()?>adminController/HourDist">Hour Dist.</a>
							</li>

						</ul>
					</li>

					<li>
						<a href=" <?=base_url(); ?>auth/logout " class="nav-item nav-link "> Logout </a>

					</li>
				</ul>

			</div>
		</nav>

		<div id="content" class="p-4 p-md-5 pt-5" onload="document.body.style.opacity='1'">