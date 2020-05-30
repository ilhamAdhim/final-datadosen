<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class register_model extends CI_Model {

    
    public function register(){       
        $user = [
            "codename"      => htmlspecialchars($this->input->post('nm',true)),
            "email"     => htmlspecialchars($this->input->post('email',true)),
            "username"  => htmlspecialchars($this->input->post('uname1',true)),
            "password"  => htmlspecialchars($this->input->post('pwd1',true)),
            "identity"  => htmlspecialchars($this->input->post('identity',true))
        ];  

        // user registered as lecturer
        if ($user['identity'] == "lecturer") {
            
            $register_user = [
            'code' => $user['codename'],
            'username' => $user['username'],
            'password' => $user['password']
            ];

            // $this->db->select('username');
            // $this->db->from('tb_lecturerlist');
            // $this->db->where('username', $register_user['username']);
            
            // $this->db->limit(1);

            // $check = $this->db->get()->result();

            /* if($this->db->error()){
                echo 'YOU ARE NOT REGISTERED AS LECTURER';
            } else{ */
                $this->db->insert('tb_lecturerlist', $register_user);
            // }

            // user registered as admin
        }else{

            
            $register_user = [
                'name' => $user['codename'],
                'username' => $user['username'],
                'password' => $user['password']
                ];


            /* $this->db->select('username');
            $this->db->from('tb_adminlist');
            $this->db->where('username', $register_user['username']);
            
            $this->db->limit(1);

            $check = $this->db->get()->result(); */

            /* if($this->db->error()){
                echo 'YOU ARE NOT REGISTERED AS ADMIN';
            } else{ */
                $this->db->insert('tb_adminlist', $register_user);
            // }
        }
               
        
    }

}

/* End of file register_model.php */


?>