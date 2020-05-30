
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

class posLec_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getLecturerPosition()
        ];
        $this->response($res, 200);
    }

    
    public function index_delete(){
        $code = $this->delete('code');
        if($code === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide a code!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteLecturerPosition($code) > 0) {
                echo 'ok';
                $this->response([
                    'status'    => true,
                    'code'        => $code,
                    'message'   => 'deleted'
                ],REST_Controller::HTTP_OK);
                # code...
            }else{
                echo 'id not found';
                $this->response([
                    'status'    => false,
                    'message'   => 'code not found !'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }

    public function index_post(){

        $data = [
            'code' => $this->post('code'),
            'name'  =>$this->post('name'),
            'position'=>$this->post('position'),
            'year' => $this->post('year'),
            'semester' => $this->post('semester')
        ];

        if($this->admin_model->createLecturerPosition($data)){
            $this->response([
                'status' => true,
                'message' => 'New Lecturer Position has been created'
            ],REST_Controller::HTTP_CREATED);
            
        }else{
            $this->response([
                'status' => false,
                'message' => 'failed to create a new data'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }
    }

     public function index_put(){
        $data = [
            'code' => $this->put('code'),
            'name'  =>$this->put('name'),
            'position'=>$this->put('position'),
            'year' => $this->put('year'),
            'semester' => $this->put('semester')
        ];

        if($this->admin_model->updateLecturerPosition($data) > 0){
            $this->response([
                'status' => true,
                'message' => 'Lecturer Position has been updated'
            ],REST_Controller::HTTP_OK);
        }else{
            $this->response([
                'status' => false,
                'message' => 'failed to update data'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }
    }

}

/* End of file admin_API.php */


?>