<div class="container">
  <nav class="breadcrumb">
    <a class="breadcrumb-item" href="#">Dashboard</a>
    <a class="breadcrumb-item" href="#"><?=$title?></a>
    <span class="breadcrumb-item active"></span>
  </nav>

  <div class="card text-left">
    <img class="card-img-top" src="holder.js/100px180/" alt="">
    <div class="card-body">
      <div class="container card-text">
        <div class="container">
          <div class="row my-2">
           <!-- Profile Picture -->
            <div class="col-lg-4 order-lg-1 mt-4 text-center mb-4">
              <img src="//placehold.it/150" class="mx-auto img-fluid img-circle d-block" alt="avatar">
              <h6 class="mt-4">Upload a different photo</h6>
              <label class="custom-file">
                <input type="file" id="file" class="custom-file-input">
                <span class="custom-file-control btn btn-info">Choose file</span>
              </label>
            </div>
            <div class="col-lg-8 order-lg-2">
              <h5 class="mb-3"><?=$info[0]->name?> </h5>
              <hr>
             
              <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                </li>
                <li class="nav-item">
                  <a href="" data-target="#messages" data-toggle="tab" class="nav-link">Messages</a>
                </li>
                <li class="nav-item">
                  <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                </li>
              </ul>

              <div class="tab-content py-4">
                <!-- INSIDE PROFILE TAB -->
                <?php $this->load->view('home/lecturers/profileLec'); ?>

                <!-- INSIDE MESSAGES TAB -->
                <?php $this->load->view('home/lecturers/messageLec');?>

                <!-- INSIDE EDIT TAB -->
                <?php $this->load->view('home/lecturers/editLec');?>

                <!-- end of main container -->
              </div>

              <!-- Kontrak Perkuliahan  -->
              <hr>
              <h2 id="subjects"> <b> Kontrak Perkuliahan</b> </h2>
              <br>

              <?php $this->load->view('home/lecturers/subjects'); ?>


              <!-- RESEARCH GROUP -->
              <hr>
              <h2 id="researchGroup"> <b> Research Group</b> </h2>
              <?php $this->load->view('home/lecturers/researchGroup');?>

              <hr>

            </div>
          </div>
        </div>


      </div>
    </div>
  </div>
</div>
