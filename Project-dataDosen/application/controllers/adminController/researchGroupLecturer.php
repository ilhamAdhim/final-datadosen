<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class researchGroupLecturer extends CI_Controller {

    
    public function __construct()
    {        
        parent::__construct();
        $this->API = 'http://localhost/Project-dataDosen/api/admins/resLec_API';
        $this->load->library('Excel');
        $this->load->model('admin_model');
        
        //Do your magic here
    }
    
    public function index()
    {
        if($this->session->userdata('loggedIn')){
            $result = $this->curl->simple_get($this->API);

            //vu_research        
            $lcResearch['response'] = json_decode($result,true);
            $lcResearch['title'] = 'Research Group Lecturer';
            $lcResearch['message'] = $this->message;

            $this->load->view('template/header_admin', $lcResearch);
            $this->load->view('home/admins/content', $lcResearch);
            $this->load->view('template/footer_admin', $lcResearch);
        }else{
            redirect(base_url());
        }
    }
    public function createResearchGroupLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code'),
                    'name'  =>$this->input->post('name'),
                    'research'=>$this->input->post('research'),
                    'priority' => $this->input->post('priority')
                ];
        
                $result = $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));            
                
                $this->message = 'Research Group Lecturer has successfully <b> created </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }


    public function updateResearchGroupLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code'),
                    'name'  =>$this->input->post('name'),
                    'research'=>$this->input->post('research'),
                    'priority' => $this->input->post('priority')
                ];
        
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));            
                
                $this->message = 'Research Group Lecturer has successfully <b> updated </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }

    public function deleteResearchGroupLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code')
                ];
            }
            $this->curl->simple_delete($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            
            $this->message = 'Research Group Lecturer has successfully <b> deleted </b>';
            $this->index();
        }else{
            redirect(base_url());
        }   
    }


    public function upload(){
        $fileName = time().$_FILES['file']['name'];
        
        $config['upload_path'] = 'assets/uploads/csv/'; //create folder assets in root 
        $config['file_name'] = $fileName;
        $config['allowed_types'] = 'xls|xlsx|csv'; //set file format
        $config['max_size'] = 10000;
         

        $this->load->library('upload'); //load library upload 
        $this->upload->initialize($config); //loaded library comes with configuration
         
        if(!$this->upload->do_upload('file') )
        $this->upload->display_errors();
             
        $media = $this->upload->data('file');
        $inputFileName = 'assets/uploads/csv/'.$fileName;
         
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
                    'code'       =>  $rowData[0][0],
                    'name'    =>  $rowData[0][1],
                    'research'    =>  $rowData[0][2],
                    'priority'     =>  $rowData[0][3]
                );
                 
                //Match with the model and which function to execute
                $this->admin_model->createLecturerResearch($data);
                // use to delete the file as soon as it updates the database
                delete_files('C:/xampp/htdocs/Project-dataDosen/assets/uploads/csv');      
                    
            }
            redirect('adminController/researchGroupLecturer');
    }
    
    public function template(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("code", "name" , "research" , "priority");
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
        header('Content-Disposition: attachment;filename="researchGroupLecturer.xlsx"');
        $object_writer->save('php://output');
    }

    public function export(){
        
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);

        // On excel columns
        $table_columns = array("code", "name" , "research" , "priority");
        $column = 0;
        // Fill excel column values
        foreach($table_columns as $field){
          $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
          $column++;
        }
  
        $priority = $this->admin_model->getLecturerResearch();
        $excel_row = 2;
        
        // Fill the values of row based on excel's column 
        foreach($priority as $row){
          $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->code);
          $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->name);
          $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $row->research);
          $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, $row->priority);
          $excel_row++;
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
        header('Content-Disposition: attachment;filename="Lecturer-priority.xlsx"');

        $object_writer->save('php://output');
  
    }



}

/* End of file researchGroup.php */


?>