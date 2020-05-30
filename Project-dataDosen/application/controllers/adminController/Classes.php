<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Classes extends CI_Controller {

    
    public function __construct()
    {        
        parent::__construct();
        $this->API = 'http://localhost/Project-dataDosen/api/admins/class_API';
        $this->load->library('Excel');
        $this->load->helper('file');
        $this->load->model('admin_model');
        //Do your magic here
    }
    
    public function index()
    {
        //tb_class

        if($this->session->userdata('loggedIn')){

            $result = $this->curl->simple_get($this->API);

            $classes = [
                'response'  => json_decode($result,true),
                'title'     => 'Classes',
                'message'   => $this->message
            ];

            $this->load->view('template/header_admin', $classes);
            $this->load->view('home/admins/content', $classes);
            $this->load->view('template/footer_admin', $classes);
        }else{
            redirect(base_url());
        }
    }

    public function createClasses(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'cl_id'       =>  $this->input->post('cl_id'),
                    'cl_major'    =>  $this->input->post('cl_major'),
                    'cl_level'    =>  $this->input->post('cl_level'),
                    'cl_name'     =>  $this->input->post('cl_name')
                ];
                    
                $result = $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                    
                $this->message = 'Class has successfully <b> created </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }


    public function updateClasses(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'cl_id'       =>  $this->input->post('cl_id'),
                    'cl_major'    =>  $this->input->post('cl_major'),
                    'cl_level'    =>  $this->input->post('cl_level'),
                    'cl_name'     =>  $this->input->post('cl_name')
                ];
                    
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                    
                $this->message = 'Class has successfully <b> updated </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
        
    }

    public function deleteClasses(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'cl_id' => $this->input->post('cl_id')
                ];
            }
            $this->curl->simple_delete($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            $this->message = 'Class has successfully <b> deleted </b>';
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
                    'cl_id'       =>  $rowData[0][0],
                    'cl_major'    =>  $rowData[0][1],
                    'cl_level'    =>  $rowData[0][2],
                    'cl_name'     =>  $rowData[0][3]
                );
                 
                //Match with the model and which function to execute
                $this->admin_model->createClass($data);
                // use to delete the file as soon as it updates the database
                delete_files('C:/xampp/htdocs/Project-dataDosen/assets/uploads/csv');      
            }
            redirect('adminController/Classes');
    }


    public function template(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("cl_id", "cl_major", "cl_level" , "cl_name");
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
        header('Content-Disposition: attachment;filename="Classes.xlsx"');
        $object_writer->save('php://output');
    }

    public function export(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("cl_id", "cl_major", "cl_level" , "cl_name");
        $column = 0;
  
        // Fill excel column values
        foreach($table_columns as $field){
          $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
          $column++;
        }
  
        $classes = $this->admin_model->getClasses();
  
        $excel_row = 2;
  
        // Fill the values of row based on excel's column 
        foreach($classes as $row){
  
          $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->cl_id);
          $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->cl_major);
          $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $row->cl_level);
          $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, $row->cl_name);
  
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
        header('Content-Disposition: attachment;filename="Classes.xlsx"');
        $object_writer->save('php://output');
      }
}

/* End of file researchGroup.php */


?>