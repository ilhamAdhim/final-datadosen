<?php 


defined('BASEPATH') OR exit('No direct script access allowed');


require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
use RestServer\Libraries\REST_Controller;


class dosen_API extends REST_Controller {

    
    public function __construct($config ='rest')
    {
        parent::__construct($config);
        $this->load->model('lecturer_model');
    }
    

    public function index_get()
    {
        $code = $this->get('code');    
        $res = [
            'position' => $this->lecturer_model->lecPositionYear($code),
            'research' => $this->lecturer_model->lecResearchPriority($code),
            'subject' => $this->lecturer_model->lecSubject($code),
            'info'  => $this->lecturer_model->getPersonalInfo($code)
        ];
        $this->response($res, 200);
    }
}

/* End of file Mahasiswa.php */


?>