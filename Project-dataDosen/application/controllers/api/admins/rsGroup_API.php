
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

Class rsGroup_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getResearchGroups()
        ];
        $this->response($res, 200);
    }

    function index_post() {
        $data = [
            'rs_id'     => $this->post('rs_id'),
            'research'  => $this->post('research'),
        ];
        
        if($this->admin_model->createResearchGroups($data) > 0){
            $this->response([
                'status' => true,
                'message' => 'Research Group has been updated'
            ],REST_Controller::HTTP_OK);
        }else{
            $this->response([
                'status' => false,
                'message' => 'failed to update data'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }
    }

     public function index_put(){

         $data = [
            'rs_id'     => $this->put('rs_id'),
            'research'  => $this->put('research'),
        ];

         if($this->admin_model->updateResearchGroup($data,$id) > 0){
             $this->response([
                 'status' => true,
                 'message' => 'Research Group has been updated'
             ],REST_Controller::HTTP_OK);
         }else{
             $this->response([
                 'status' => false,
                 'message' => 'failed to update data'
             ],REST_Controller::HTTP_BAD_REQUEST);
         }
     }

     
    public function index_delete(){
        $rs_id = $this->delete('rs_id');
        if($rs_id === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide a rs_id!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteResearchGroup($rs_id) > 0) {
                $this->response([
                    'status'    => true,
                    'id'        => $rs_id,
                    'message'   => 'deleted'
                ],REST_Controller::HTTP_OK);
                # code...
            }else{
                $this->response([
                    'status'    => false,
                    'message'   => 'rs_id not found !'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }
}

/* End of file admin_API.php */


?>