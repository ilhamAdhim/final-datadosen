<br>

<div class="row mx-auto container">
    <!-- GROUP RESEARCH -->
    <?php if(!empty($research)){ ?>
    <div class="container">
        <div class="card-deck">
            <?php foreach ($research as $gr => $value) { ?>
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
            </div>
            <!-- Card -->
            <!-- Card -->
            <?php } 
            } else{ ?>
            <div class="mx-auto">
                <strong> You are not included in any group research </strong>
            </div>

            <?php } ?>
        </div>
    </div>
</div>