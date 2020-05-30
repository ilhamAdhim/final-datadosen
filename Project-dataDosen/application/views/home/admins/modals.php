
<!-- Modal -->
<div class="modal fade" id="<?=$purpose?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><?=ucfirst($purpose)?> <?=$title?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <?=form_open('adminController/'.str_replace(' ','',$title).'/'.str_replace(' ','', $purpose.$title));?>
            <form action="" method="post">
                <div class="modal-body">
                    <?php foreach ($response['data'][0] as $key => $value) { ?>
                        <div class="md-form">
                            <label for="<?=$key?>"><?=$key?></label>
                        <?php if($purpose === 'update'){ ?>
                            <input type="text" class="form-control" id="<?=$key?>" name="<?=$key?>" required="" value="<?=$value?>">
                        <?php }else if($purpose === 'delete') { ?>
                            <input type="text" class="form-control" id="<?=$key?>" name="<?=$key?>">
                            <?php break;?>
                        <?php }else{ ?>
                            <input type="text" class="form-control" id="<?=$key?>" name="<?=$key?>" required="">
                        <?php } ?>
                            <div class="invalid-feedback">Oops, you missed this one.</div>
                        </div>
                        <?php } ?>
                        
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <!-- Submit button -->
                    <?=form_submit('submit','Submit',"class='btn btn-primary'");?>
                </div>
            </form> 
        </div>
    </div>
</div>

<script>

</script>

<style>

.modal-header {
    cursor: move;
}</style>