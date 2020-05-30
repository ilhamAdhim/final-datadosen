<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class admin_model extends CI_Model {

    public function index(){
       
    }
//========================================================================================================================
//========================================================================================================================
    // Research Groups
        public function getResearchGroupsAmount(){
            $this->db->get('tb_research_category');
            return $this->db->affected_rows();
        }

        public function getSubResearchGroupsAmount(){
            $this->db->get('tb_research_sub_category');
            return $this->db->affected_rows();
        }

        public function createResearchGroups($data = null){
            $this->db->insert('tb_research_category', $data);
        }

        public function getResearchGroups(){
            return $this->db->order_by('rs_id')->get('tb_research_category')->result();
        }

        public function getSubResearchGroup($research = null){
            if($research){
                return $this->db->get_where('vu_research_group_details',['research' => $research] )->result();
            }else{
                return $this->db->get('vu_research_group_details')->result();
            }
        }

        public function updateResearchGroup($data){
            $this->db->where('rs_id',$data['rs_id'] );
            $this->db->update('tb_research_category', $data);
        }


        public function deleteResearchGroup($id){
            $this->db->where('rs_id', $id);
            $this->db->delete('tb_research_category');
        }

//========================================================================================================================
//========================================================================================================================
   
    //Classes
        public function getAmountClasses(){
            $this->db->get('tb_class');
            return $this->db->affected_rows();
        }

        public function getClasses(){
            return $this->db->order_by("cl_id")->get('tb_class')->result();
        }

        public function createClass($data = null){
            $this->db->insert('tb_class', $data);
        }

        public function updateClass($data){
            $this->db->where('cl_id',$data['cl_id']);
            $this->db->update('tb_class', $data);
        }

        public function deleteClass($id){
            $this->db->where('cl_id', $id);
            $this->db->delete('tb_class');
        }

    //Lecturers
//========================================================================================================================
//========================================================================================================================
    // Status
            public function getLecturerStatus($code = null){
                if($code){
                    return $this->db->get('tb_lec_status', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_status')->result();
                }
            }
            
            public function createLecturerStatus($data = null){
                $this->db->insert('tb_lec_status', $data);
            }

            public function updateLecturerStatus($data){
                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_status', $data);
            }

            public function deleteLecturerStatus($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_status');   
            }

//========================================================================================================================
//========================================================================================================================

        // Field
            public function getLecturerField($code = null){
                if($code){
                    return $this->db->get('tb_lec_field', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_field')->result();
                }
            }

            public function createLecturerField($data = null){
                $this->db->insert('tb_lec_field', $data);
            }


            public function updateLecturerField($data){
                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_field', $data);
            }

            public function deleteLecturerField($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_field');
            }
//========================================================================================================================
//========================================================================================================================
        // Position
            public function getLecturerPosition($code = null){
                if($code){
                    return $this->db->get('tb_lec_position', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_position')->result();
                }
            }

            public function createLecturerPosition($data = null){
                $this->db->insert('tb_lec_position', $data);
            }


            public function updateLecturerPosition($data){
                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_position', $data);
            }

            public function deleteLecturerPosition($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_position');
            }
//========================================================================================================================
//========================================================================================================================

        // Research
            public function getLecturerResearch($code = null){
                if($code){
                    return $this->db->get('tb_lec_research', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_research')->result();
                }
            }
            public function deleteLecturerResearch($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_research');
            }

            public function createLecturerResearch($data = null){
                $this->db->insert('tb_lec_research', $data);
            }

            public function updateLecturerReserch($data){
                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_research', $data);
            }
//========================================================================================================================
//========================================================================================================================

        // DPA
            public function getLecturerDPA($code = null){
                if($code){
                    return $this->db->get('tb_lec_dpa', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_dpa')->result();
                }
            }

            public function deleteLecturerDPA($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_dpa');
            }

            public function createLecturerDPA($data = null){
                $this->db->insert('tb_lec_dpa', $data);
            }

            public function updateLecturerDPA($data){
                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_dpa', $data);
            }
//========================================================================================================================
//========================================================================================================================

        //Hour Distribution - Not done
            public function getHourDistribution($code = null){
                if($code){
                    return $this->db->get('tb_lec_hourdist', ['code' => $code])->result();
                }else{
                    return $this->db->get('tb_lec_hourdist')->result();
                }
            }

            public function deleteHourDistribution($code){
                $this->db->where('code', $code);
                $this->db->delete('tb_lec_hourdist');
            }


            public function createHourDistribution($data = null){
                $this->db->insert('tb_lec_hourdist', $data);
            }


            public function updateHourDistribution($data){
                

                $this->db->where('code', $data['code']);
                $this->db->update('tb_lec_hourdist', $data);
            }
//========================================================================================================================
//========================================================================================================================

        public function getAmountLecturers(){
            $this->db->get('tb_lecturer');
            return $this->db->affected_rows();
        }
        
        public function createLecturer($data){
            $data = [
                'NIP'       => $this->input->post('NIP'),
                'NIDN'      => $this->input->post('NIDN'),
                'code'      => $this->input->post('code'),
                'name'      => $this->input->post('name'),
                'status'    => $this->input->post('status'),
                'field_of_study'    => $this->input->post('field_of_study'),
                'phone_num' => $this->input->post('phone_num')  
            ];

            $this->db->insert('tb_lecturer', $data);
        }

        public function updateLecturer($code){
            $data = [
                'NIP'       => $this->input->post('NIP'),
                'NIDN'      => $this->input->post('NIDN'),
                'name'      => $this->input->post('name'),
                'status'    => $this->input->post('status'),
                'field_of_study'    => $this->input->post('field_of_study'),
                'phone_num' => $this->input->post('phone_num')  
            ];
            $this->db->where('code', $this->input->post('code'));
            $this->db->update('tb_lecturer', $data);
        }

        public function deleteLecturer(){
            $this->db->where('code',$this->input->post('code'));
            $this->db->delete('tb_lecturer');
        }
//========================================================================================================================
   //Subjects
        public function getAmountSubjectsByMajor($major){
            $this->db->get_where('tb_subjects',['major' => $major]);
            return $this->db->affected_rows();
        }

        public function getSubjects(){
            $this->db->order_by('semester');
            return $this->db->get('tb_subjects')->result();
        }

        public function createSubject($data = null){
            $this->db->insert('tb_subjects', $data);
        }

        public function updateSubject($data){
            $this->db->where('subject_code', $data['subject_code']);
            $this->db->update('tb_subjects', $data);
        }

        public function deleteSubject($subj_code){
           $this->db->where('subject_code', $subj_code);
           $this->db->delete('tb_subjects');
        }
//========================================================================================================================
//========================================================================================================================

    //RPS_SAP
    public function getSubjectsRPSSAP(){
        $this->db->order_by('SAP');
        return $this->db->get('tb_rps_sap')->result();
    }

    public function checkSubjectCode($name){
        
        $listSubjectCode = $this->db->get('tb_rps_sap')->result_array();
        foreach ($listSubjectCode as $key => $value) {
            if($value['subject_code'] === $name[1]){
                return true;
            }
        }
        return false;
        
    }

    public function getOneSubjectsRPSSAP($name){
        if($name[0] == "RPS"){
            $this->db->where('RPS', $name[0]);
        }else{
            $this->db->where('SAP', $name[0]);
        }
        $this->db->where('subject_code', $name[1]);
        
        return $this->db->get('tb_rps_sap')->result();
    }

    public function createSubjectsRPSSAP($data = null){
        $this->db->insert('tb_rps_sap', $data);
    }

    public function updateSubjectsRPSSAP($data){
        $this->db->where('subject_code', $data['subject_code']);
        $this->db->update('tb_rps_sap', $data);
    }

    public function deleteSubjectsRPSSAP($subj_code){
       $this->db->where('subject_code', $subj_code);
       $this->db->delete('tb_rps_sap');
    }
    
//========================================================================================================================
//========================================================================================================================

// Lecture Contract

 
public function getLectureContract(){
    return $this->db->get('tb_contract_files')->result();
}

public function getOneLectureContract($name){
    $details = explode('_',$name);

    $this->db->where('contract_file', $name);
    $this->db->where('subject_code', $details[1]);
    return $this->db->get('tb_contract_files')->result();
}

public function createLectureContract($data = null){
    $this->db->insert('tb_contract_files', $data);
}

public function updateLectureContract($data){
    $this->db->where('subject_code',$data['subject_code']);
    $this->db->update('tb_contract_files', $data);
}

public function deleteLectureContract($condition){
    $this->db->where($condition);
    $this->db->delete('tb_contract_files');
}


    
}

/* End of file admin.php */

?>