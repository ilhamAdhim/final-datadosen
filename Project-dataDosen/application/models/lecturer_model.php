<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class lecturer_model extends CI_Model {

    
    public function __construct()
    {
        parent::__construct();
        // $this->API = 'http://localhost/Project-dataDosen/api/lecturer';
    }

    // take lecturer's position and it's year and semester on the database
    
    public function lecPositionYear($code){
        $this->db->select('position,year');
        return $this->db->get_where('vu_position_2019',['code' =>$code])->result();   
    }
    // take lecturer's group research and it's priority on the database

    public function lecResearchPriority($code){
        $this->db->select('research,priority');
        
        return $this->db->get_where('vu_research',['code' => $code])->result();   
    }

    // take what subjects that lecturer's teach to student

    public function lecSubject($code){
        $this->db->select('subject,subject_code,class');
        return $this->db->get_where('vu_class_schedule',['code' => $code])->result();
    }

    public function getPersonalInfo($code){
        return $this->db->get_where('vu_lecturer_personal',['code' => $code])->result();
    }

    
    public function getAccount($code){
        $this->db->select('username,email');
        return $this->db->get_where('tb_lecturerlist',['code' => $code])->result();
    }

    

    public function updatePersonalInfo(){
            $data = [
                'username'  =>$this->input->post('username'),
                'email'=>$this->input->post('email'),
                'phone'=>$this->input->post('phone')
            ];
            
            // Update the data based on the condition and new value given
            $this->db->where('code',$this->input->post('code'));
            $this->db->update('tb_lecturerlist', $data);   
        
    }

    public function changePassword($data){
        $this->db->where('code', $data['code']);
        $this->db->update('tb_lecturerlist', $data);
    }

    
    // Last feature - 25 May 2020
    public function isSubjectDownloadable($data){
        // get the list of subject per lecturer
        $result = [];

        foreach ($data as $key => $value) {
            // Fetch info from tb_contract_files
            $this->db->select('subject_code');
            $source = $this->db->get_where('tb_contract_files ',['subject_code' => $value->subject_code])->result();
            $isExist = empty($source) ? false : true;
            array_push($result, $isExist);
        }
        return $result;
    }

    public function getFileContract($condition){
        $this->db->where('code', $condition['code']);
        $this->db->where('subject_code', $condition['subject_code']);
        return $this->db->get('vu_contracts_lecturer')->result();
    }

    public function checkSubjectCode($param){
        $listSubjectCode = $this->db->get('tb_contract_files')->result_array();
        foreach ($listSubjectCode as $key => $value) {
            if($value['subject_code'] === $param){
                return true;
            }
        }
        return false;
    }
    
    public function updateContract($data){
        $this->db->where('subject_code', $data['subject_code']);
        $this->db->update('tb_contract_files', $data);
    }

    public function insertContract($data = null){
        $this->db->insert('tb_contract_files', $data);
    }
}
    
/* End of file lecturer_model.php */


?>
