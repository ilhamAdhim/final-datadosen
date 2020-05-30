
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

class hourDisLec_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getHourDistribution()
        ];
        $this->response($res, 200);
    }

    function index_post() {
        $data = [
            'code'     => $this->post('code'),
            'name'  => $this->post('name'),
            'subject'  => $this->post('subject'),
            'class'   => $this->post('class'),
            'total_hour'   => $this->post('total_hour'),
            'semester'   => $this->post('semester'),
            'year'   => $this->post('year')
        ];
        
        if($this->admin_model->createHourDistribution($data) > 0){
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
            'code'     => $this->put('code'),
            'name'  => $this->put('name'),
            'subject'  => $this->put('subject'),
            'class'   => $this->put('class'),
            'total_hour'   => $this->put('total_hour'),
            'semester'   => $this->put('semester'),
            'year'   => $this->put('year')
        ];

         if($this->admin_model->updateHourDistribution($data) > 0){
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
        $code = $this->delete('code');

        if($code === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide an code!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteHourDistribution($code) > 0) {
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