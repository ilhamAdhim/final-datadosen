
<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


defined('BASEPATH') OR exit('No direct script access allowed');

class Subjects_API extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    
    public function index_get()
    {  
        $res = [
            'status' => true,
            'data' => $this->admin_model->getSubjects()
        ];
        $this->response($res, 200);
    }
    
    function index_post() {
        $data = [
            'subject_code'  => $this->post('subject_code'),
            'subject'       => $this->post('subject'),
            'credit_hour'   => $this->post('credit_hour'),
            'T/P'           => $this->post('T/P'),
            'semester'      => $this->post('semester'),
            'level'         => $this->post('level'),
            'major'         => $this->post('major'),
            'year'          => $this->post('year')
        ];
        
        if($this->admin_model->createSubject($data) > 0){
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
            'subject_code'  => $this->put('subject_code'),
            'subject'       => $this->put('subject'),
            'credit_hour'   => $this->put('credit_hour'),
            'T/P'           => $this->put('T/P'),
            'semester'      => $this->put('semester'),
            'level'         => $this->put('level'),
            'major'         => $this->put('major'),
            'year'          => $this->put('year')
        ];

         if($this->admin_model->updateSubject($data,$id) > 0){
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
        $subject_code = $this->delete('subject_code');
        if($subject_code === null){
            $this->response([
                'status'    => false,
                'message'     => 'Provide an subject_code!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }else{
            if ($this->admin_model->deleteSubject($subject_code) > 0) {
                echo 'ok';
                $this->response([
                    'status'    => true,
                    'id'        => $subject_code,
                    'message'   => 'deleted'
                ],REST_Controller::HTTP_OK);
                # code...
            }else{
                echo 'subject_code not found';
                $this->response([
                    'status'    => false,
                    'message'   => 'subject_code not found !'
                ],REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }

}

/* End of file admin_API.php */


?>