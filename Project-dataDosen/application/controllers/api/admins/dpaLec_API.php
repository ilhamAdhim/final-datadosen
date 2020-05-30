
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

class dpaLec_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getLecturerDPA()
        ];
        $this->response($res, 200);
    }
    function index_post() {
        $data = [
            'code'       => $this->post('code'),
            'name'       => $this->post('name'),
            'class_name'  => $this->post('class_name'),
            'year'   => $this->post('year')
        ];
        
        if($this->admin_model->createLecturerDPA($data) > 0){
            $this->response([
                'status' => true,
                'message' => 'Lecturer DPA has been updated'
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
            'code'       => $this->put('code'),
            'name'       => $this->put('name'),
            'class_name'  => $this->put('class_name'),
            'year'   => $this->put('year')
        ];
        

         if($this->admin_model->updateLecturerDPA($data) > 0){
             $this->response([
                 'status' => true,
                 'message' => 'Lecturer DPA has been updated'
             ],REST_Controller::HTTP_OK);
         }else{
             $this->response([
                 'status' => false,
                 'message' => 'failed to update data'
             ],REST_Controller::HTTP_BAD_REQUEST);
         }
     }

     
    public function index_delete(){
        $code = $this->delete('code');

        if($code === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide a code!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteLecturerDPA($code) > 0) {
                echo 'ok';
                $this->response([
                    'status'    => true,
                    'id'        => $code,
                    'message'   => 'deleted'
                ],REST_Controller::HTTP_OK);
                # code...
            }else{
                echo 'code not found';
                $this->response([
                    'status'    => false,
                    'message'   => 'code not found !'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }

}

/* End of file admin_API.php */


?>