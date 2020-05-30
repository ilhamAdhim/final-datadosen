<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class admin_home extends CI_Controller {

    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin_model');
    }
    

    public function index()
    {
        $data = array(
            'title' => 'Admin Home',
            'identity'          => $this->session->userdata('identity'),
            'admin'             => $this->session->userdata('user'),
            'amountClasses'     => $this->admin_model->getAmountClasses(),
            'amountSubjectsOfD4'=> $this->admin_model->getAmountSubjectsByMajor('D4'),
            'amountSubjectsOfD3'=> $this->admin_model->getAmountSubjectsByMajor('D3'),
            'amountLecturers'   => $this->admin_model->getAmountLecturers(),
        );
        
        // $data['title'] = "Admin Home";
        $this->load->view('template/header_admin', $data);
        $this->load->view('home/adminHome', $data);
        $this->load->view('template/footer_admin', $data);
    }  
    
    
}

/* End of file home.php */

?>