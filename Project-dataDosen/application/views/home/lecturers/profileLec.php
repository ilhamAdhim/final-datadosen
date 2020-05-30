<div class="tab-pane active" id="profile">
    <div class="row">
        <div class="col-md-6">
            <h6>Codename</h6>
            <p>
                <?=$code?>
            </p>

            <hr>

            <h6>Status</h6>
            <?php if($info[0]->status == 'PNS'){ ?>
            <div class="alert alert-success">
                You are a <b> PNS </b>
            </div>
            <?php }else{ ?>
            <div class="alert alert-info">
                You are a <b> <?=$info[0]->status?> </b>
            </div>
            <?php } ?>

        </div>
        <div class="col-md-6">
            <h6>NIP</h6>
            <p>
                <?=$info[0]->NIP ? $info[0]->NIP : 'Not Set' ?>
            </p>

            <hr>

            <h6>NIDN</h6>
            <p>
                <?= $info[0]->NIDN ? $info[0]->NIDN : 'Not Set' ?>
            </p>
        </div>
        <div class="col-md-12">
            <table class="table table-sm table-hover table-striped">
                <tbody>
                    <thead>
                        <th>Position</th>
                        <th>Year</th>
                    </thead>
                    <?php if(!empty($position)) { ?>
                    <tr>
                        <?php if(is_array($position)){
                            foreach ($position[0] as $ps => $value) { ?>
                                <td> <?=$value?></td>
                        <?php }}else{
                            foreach ($position as $key => $value) { ?>
                                <td> <?=$value->position?> : <?=$value->year?> </td>
                        <?php } ?>
                    </tr>
                    <?php }} ?>

                    <tr>
                        <td> <strong>Lecturer</strong> in Information Technology Division </td>
                        <td>2019</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--/row-->
</div>