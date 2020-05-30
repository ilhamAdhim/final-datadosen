<!-- <div class="container"> -->
<div class="row mt-3">
    <div class="col-md-9 mr-1 card p-4">
        <h3>Data <?=$title?></h3>
        <hr>

        <?php if (isset($message)) { ?>
            <div class="alert alert-success" role="alert">
                <?=$message?>
            </div>
        <?php } ?>

        <?php if($response['data'] != null){ ?>
            <table class="table-striped table table-bordered" id="data-read">
                <thead>
                    <tr>
                        <!-- Column Name -->
                        <?php foreach ($response['data'][0] as $key => $value) { ?>
                        <th> <?=$key?></th>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php $col = -1;
                        foreach ($response['data'] as $cl) { ?>
                    <tr>
                        <?php foreach($cl as $key){ ?>
                            <?php $col++;?>
                            <form action="lectureContract/downloadFile" method="post">
                                <td> 

                                <?php if($col == 1) { ?>
                                    <input type="hidden" name="type" value="<?=$col?>">
                                    <input type="hidden" name="filename" value="<?=$key?>">
                                    
                                        <input type="submit" class="normal" value="<?=$key?>">
                                    
                                <?php } else{ ?>
                                    <?=$key?>
                                <?php } ?>
                                </td>
                            </form>
                        
                        <?php } ?>

                        <?php $col = -1;?>
                    </tr>

                    <?php } ?>
                </tbody>
            </table>
        <?php }else{ ?>
            <h3><center>No entry in <?=$title?></center></h3>
        <?php } ?>
        <hr>

        <!-- Load view content_bottom for buttons export and import -->
        <!-- Content Bottom -->
        <div class="row">
            <div class="col-sm-6">
                <div class="ml-4">
                    <h4>Upload excel file</h4> <br>
                    <p>Input data faster</p>
                </div>
                <div class="mt-3  align-items-center">

                    <form action="upload" method="post" enctype="multipart/form-data">
                        <input name="file" id="fileInput" type="file" />
                        <input class="btn btn-info" type="submit" value="Upload file" disabled />
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                <h4>Get Excel Data</h4> <br>
                <p>Get template of CSV or Export the whole data </p>
                <div class="mt-3 pull-left align-items-center">
                    <form method="post" action="<?=str_replace(' ','',$title)?>/template">
                        <input type="submit" name="template" class="btn btn-success" value="CSV Template" />
                    </form>
                </div>
                <div class="mt-3 pull-right align-items-center">
                    <form method="post" action="<?=str_replace(' ','',$title)?>/export">
                        <input type="submit" name="export" class="btn btn-success" value="Export" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    

    <!-- Load view content_aside for buttons CRUD    -->
    <?php $this->load->view('home/admins/content_aside'); ?>
</div>

<!-- </div> -->


<!-- Target is used to access the modal, title as indicator, and val is the data given based on each controller -->

<?php
      
      $this->load->view('home/admins/modals', ['title' => $title, 'val' => $response['data'] , 'purpose' => 'create']);
      
      $this->load->view('home/admins/modals', ['title' => $title, 'val' => $response['data'] , 'purpose' => 'update']);
      
      $this->load->view('home/admins/modals', ['title' => $title, 'val' => $response['data'] , 'purpose' => 'delete']);
      
?>
<style>

.normal{
    font-family:inherit;
    background-color:inherit;
    border:0;
    padding:0
}


input[type='submit']:hover{
    
}

</style>



<script>
    $(document).ready(
        function () {
            $('input:file').change(
                function () {
                    if ($(this).val()) {
                        $('input:submit').attr('disabled', false);
                    }
                }
            );
        });
</script>
