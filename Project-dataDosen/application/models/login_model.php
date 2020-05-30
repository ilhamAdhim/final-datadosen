<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class login_model extends CI_Model {

        function login($username,$password){
     
            $this->db->select('username,password');
            $this->db->from('tb_lecturerlist');
            $this->db->where('username', $username);
            $this->db->where('password', $password);
            $this->db->limit(1); //Retrieved data is only 1
            
            $query = $this->db->get();
            // Search for table lecturer first then table admin 
            if ($query -> num_rows() == 1) { //Jika data ditemukan
                $this->db->select('*');
                $this->db->from('tb_lecturerlist');
                $this->db->where('username', $username);
                
                $this->db->limit(1); //Retrieved data is only 1
                
                $loggedInUser = $this->db->get()->result();
                return $loggedInUser;
            }else{
                $this->db->select('*');
                $this->db->from('tb_adminlist');
                $this->db->where('username', $username);
                
                $this->db->where('password', $password);
                $this->db->limit(1); //Retrieved data is only 1

                $query = $this->db->get();
                if ($query -> num_rows() == 1) { //Jika data ditemukan
                    $loggedInUser = $query -> result();
                    array_push($loggedInUser,$identity ='Admin');
                    
                    return $loggedInUser;
                }else{
                    return false;
                }
            }
        }
    }

    /* End of file login_model.php */
?>