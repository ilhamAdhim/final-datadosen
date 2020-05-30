
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

class class_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getClasses()
        ];
        $this->response($res, 200);
    }

    function index_post() {
        $data = [
            'cl_id'     => $this->post('cl_id'),
            'cl_major'  => $this->post('cl_major'),
            'cl_level'  => $this->post('cl_level'),
            'cl_name'   => $this->post('cl_name')
        ];
        
        if($this->admin_model->createClass($data) > 0){
            $this->response([
                'status' => true,
                'message' => 'Class has been updated'
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
            'cl_id'     => $this->put('cl_id'),
            'cl_major'  => $this->put('cl_major'),
            'cl_level'  => $this->put('cl_level'),
            'cl_name'   => $this->put('cl_name')
        ];

         if($this->admin_model->updateClass($data) > 0){
             $this->response([
                 'status' => true,
                 'message' => 'Class has been updated'
             ],REST_Controller::HTTP_OK);
         }else{
             $this->response([
                 'status' => false,
                 'message' => 'failed to update data'
             ],REST_Controller::HTTP_BAD_REQUEST);
         }
     }

     
    public function index_delete(){
        $cl_id = $this->delete('cl_id');

        if($cl_id === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide an cl_id!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteClass($cl_id) > 0) {
                echo 'ok';
                $this->response([
                    'status'    => true,
                    'id'        => $cl_id,
                    'message'   => 'deleted'
                ],REST_Controller::HTTP_OK);
                # code...
            }else{
                echo 'cl_id not found';
                $this->response([
                    'status'    => false,
                    'message'   => 'cl_id not found !'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }


}

/* End of file admin_API.php */


?>