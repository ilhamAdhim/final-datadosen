<?php


class SubjectsRPSSAP extends CI_Controller {

    
    public function __construct()
    {        
        parent::__construct();
        $this->API = 'http://localhost/Project-dataDosen/api/admins/rps_sap_API';
        $this->load->library('Excel');
        $this->load->helper('file');
        $this->load->model('admin_model');
        $this->load->library('upload');
        
        //Do your magic here
    }
    
    public function index()
    {
        if($this->session->userdata('loggedIn')){
            //tb_rps_sap
            $result = $this->curl->simple_get($this->API);

            $rps_sap['response'] = json_decode($result,true);
            $rps_sap['title'] = 'Subjects RPS SAP';
            $rps_sap['message'] = $this->message;

            $this->load->view('template/header_admin', $rps_sap);
            $this->load->view('home/admins/content_rps_sap', $rps_sap);
            $this->load->view('template/footer_admin', $rps_sap);
        }else{
            redirect(base_url());
        }
    }

    public function createSubjectsRPSSAP(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'subject_code'       => $this->input->post('subject_code'),
                    'RPS'       => $this->input->post('RPS'),
                    'SAP'  => $this->input->post('SAP'),
                ];

                $result = $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                $this->message = 'RPS and SAP has successfully <b> created </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }


    public function updateSubjectsRPSSAP(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'subject_code'       => $this->input->post('subject_code'),
                    'RPS'       => $this->input->post('rps'),
                    'SAP'  => $this->input->post('sap'),
                ];
                    
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                $this->message = 'RPS and SAP has successfully <b> updated </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }

    public function deleteSubjectsRPSSAP(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'subject_code' => $this->input->post('subject_code')
                ];
            }
            $this->curl->simple_delete($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            $this->message = 'RPS and SAP has successfully <b> deleted </b>';
            $this->index();
        }else{
            redirect(base_url());
        }
        
    }

    public function downloadFile(){
        $this->load->helper('download');

        $type = $this->input->post('type') === '1' ? 'RPS' : 'SAP';

        $filename = $this->input->post('filename').'.docx';

        $data = file_get_contents(base_url('assets/uploads/'.$type.'/'.$filename));
        force_download($filename , $data);
    }

    public function uploadFile(){
        $filename = $_FILES['userfile']['name'];
        $type = substr($filename , 0 ,3) === 'RPS' ? 'RPS' : 'SAP';
        $uploadPath =  './assets/uploads/'.$type.'/';
        
        $config = [
            'upload_path'   => $uploadPath,
            'overwrite'     => TRUE,
            'allowed_types' => 'pdf|doc|docx'
        ];

        // slice the filename into 3 parts
        $file = explode('.',$filename);
        $details = explode('_',$file[0]);
        $data = [
            'subject_code'       => $details[1],
            'RPS'       => $details[0] == 'RPS' ? $file[0] : 'RPS_'.$details[1].'_'.$details[2],
            'SAP'  => $details[0] == 'SAP' ? $file[0] : 'SAP_'.$details[1].'_'.$details[2]
        ];


        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('userfile')){
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('template/header_admin');
            $this->load->view('home/admins/error', $error);
            $this->load->view('template/footer_admin');
        }else{  
        //   If no existing subject code's filename input in the database then create 
            if(!$this->admin_model->checkSubjectCode($details)){
                $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
        //  Otherwise, only update the data
            }else{
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            }
            redirect('adminController/subjectsRPSSAP');
        }
    }

    public function upload(){
        $fileName = time().$_FILES['file']['name'];
        $path = 'assets/uploads/'; //create folder assets in root 
        $config['upload_path'] = $path;
        $config['file_name'] = $fileName;
        $config['allowed_types'] = 'xls|xlsx|csv'; //set file format
        $config['max_size'] = 10000;
         

        $this->load->library('upload'); //load library upload 
        $this->upload->initialize($config); //loaded library comes with configuration
         
        if(!$this->upload->do_upload('file') )
            $this->upload->display_errors();
             
        $media = $this->upload->data('file');
        $inputFileName = 'assets/uploads/'.$fileName;
         
        try {
            // get the file and read the file name and type
                $inputFileType = PHPExcel_IOFactory::identify($inputFileName);
                $objReader = PHPExcel_IOFactory::createReader($inputFileType);
                $objPHPExcel = $objReader->load($inputFileName);
            } catch(Exception $e) {
                die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
            }
 
            $sheet = $objPHPExcel->getSheet(0);
            $highestRow = $sheet->getHighestRow();
            $highestColumn = $sheet->getHighestColumn();
             
            for ($row = 2; $row <= $highestRow; $row++){                  //  Read a row of data into an array                 
                $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row,
                                                NULL,
                                                TRUE,
                                                FALSE);
                                                 
                //Match with column names in database
                 $data = array(
                    'subject_code'       =>  $rowData[0][0],
                    'RPS'    =>  $rowData[0][1],
                    'SAP'    =>  $rowData[0][2],
                );
                 
                //Match with the model and which function to execute
                $this->admin_model->createSubjectsRPSSAP($data);
                // use to delete the file as soon as it updates the database
                delete_files('C:/xampp/htdocs/Project-dataDosen/assets/uploads/csv');
            }
            redirect('adminController/subjectsRPSSAP');
    }

    public function template(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("subject_code", "RPS" , "SAP");
        $column = 0;

        // Fill excel column values
        foreach($table_columns as $field){
            $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
            $column++;
          }
        // Auto size the column width
        foreach (range('A', $object->getActiveSheet()->getHighestDataColumn()) as $col) {
            $object->getActiveSheet()
                ->getColumnDimension($col)
                ->setAutoSize(true);
        } 

        // Set the version
        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        ob_end_clean();
  
        // Set to excel content type
        header('Content-Type: application/vnd.ms-excel');
  
        // Set the extension
        header('Content-Disposition: attachment;filename="Subjects_RPS_SAP template.xlsx"');
        $object_writer->save('php://output');
    }
    
    public function export(){
        
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);

        $table_columns = array("subject_code", "RPS" , "SAP");
        $column = 0;
        foreach($table_columns as $field){
          $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
          $column++;
  
        }
  
        $rps_sap = $this->admin_model->getSubjectsRPSSAP();
        $excel_row = 2;

        foreach($rps_sap as $row){
          $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->subject_code);
          $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->RPS);
          $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $row->SAP);
          $excel_row++;
        }

        // Auto size the column width
        foreach (range('A', $object->getActiveSheet()->getHighestDataColumn()) as $col) {
            $object->getActiveSheet()
                ->getColumnDimension($col)
                ->setAutoSize(true);
        } 
  
        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel2007');

        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Subject_RPS_SAP.xlsx"');

        $object_writer->save('php://output');
  
    }

}

?>