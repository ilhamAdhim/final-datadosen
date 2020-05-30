<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class lec_home extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('lecturer_model');
        $this->load->helper('file');
        $this->load->library('upload');
    }
    
    public function index()
    {
        if($this->session->userdata('loggedIn')){
            $code = $this->session->userdata('code');
            $teach_subjects = $this->lecturer_model->lecSubject($code);
            
            $isDownloadable = $this->lecturer_model->isSubjectDownloadable($teach_subjects);

            $data = array(
                'title'  => 'Lecturer Home',
                'code' => $code,
                'position' => $this->lecturer_model->lecPositionYear($code),
                'research' => $this->lecturer_model->lecResearchPriority($code),
                'subject' => $teach_subjects,
                'info'  => $this->lecturer_model->getPersonalInfo($code),
                'account' => $this->lecturer_model->getAccount($code),
                'isDownloadable' => $isDownloadable
            );

            $this->session->set_userdata($data);

            $this->load->view('template/header', $data);
            $this->load->view('home/lecturerHome', $data);
            $this->load->view('template/footer', $data);
        }else{
            redirect(base_url());
        }
    }

    public function editData(){
        $data = [
            'nip' => $this->input->post('nip'),
            'username'  =>$this->input->post('username'),
            'nidn'=>$this->input->post('nidn'),
            'email'=>$this->input->post('email'),
            'phone'=>$this->input->post('phone'),
            'street'=>$this->input->post('street')
        ];

        $this->lecturer_model->updatePersonalInfo();
        redirect('lec_home');
    }

    public function changePassword(){
        $data = [
            'code'      => $this->session->userdata('code'),
            'password'  => $this->input->post('password')
        ];
        
        $this->lecturer_model->changePassword($data);
        redirect('lec_home');
        
    }
   
    public function downloadContract(){
        $this->load->helper('download');
        $condition = [
            'subject_code'  => $this->input->post('subject_code'),
            'code'          => $this->input->post('code')
        ];

        $query = $this->lecturer_model->getFileContract($condition);
        $filename = $query[0]->contract_file.'.docx';
        $data = file_get_contents(base_url('assets/uploads/KontrakPerkuliahan/'.$filename));
        force_download($filename , $data);
        // var_dump($filename);
    }

    public function uploadContract(){
        $filename = $_FILES['userfile']['name'];
        $uploadPath =  './assets/uploads/KontrakPerkuliahan/';
        $file = explode('.',$filename);

        $config = [
            'upload_path'   => $uploadPath,
            'overwrite'     => TRUE,
            'allowed_types' => 'pdf|doc|docx'
        ];

        $data = [
            'subject_code'  => $this->input->post('subject_code'),
            'contract_file'  => $file[0],
            'uploaded_by'   => $this->session->userdata('code')
        ];

        $this->upload->initialize($config);
        
        if ( !$this->upload->do_upload('userfile') ){
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('template/header_admin');
            $this->load->view('home/admins/error', $error);
            $this->load->view('template/footer_admin');
        }else{  
        // Upload the data by calling the model
        //   If no existing subject code's filename input in the database then create 
            if(!$this->lecturer_model->checkSubjectCode($data['subject_code'])){
                $this->lecturer_model->insertContract($data);
        //  Otherwise, only update the data
            }else{
                $this->lecturer_model->updateContract($data);
            }
            redirect('lec_home');
        }

    }
}

/* End of file home.php */


?>