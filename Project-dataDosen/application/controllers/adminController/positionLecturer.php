<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class positionLecturer extends CI_Controller {

    
    public function __construct()
    {        
        parent::__construct();
        $this->API = 'http://localhost/Project-dataDosen/api/admins/posLec_API';
        $this->load->library('Excel');
        
        $this->load->model('admin_model');
        
        //Do your magic here
    }
    
    public function index()
    {
        if($this->session->userdata('loggedIn')){
            //vu_position
                $result = $this->curl->simple_get($this->API);

                $lcPosition['response'] = json_decode($result,true);
                $lcPosition['title'] = 'Position Lecturer';
                $lcPosition['message'] = $this->message;

                $this->load->view('template/header_admin', $lcPosition);
                $this->load->view('home/admins/content', $lcPosition);
                $this->load->view('template/footer_admin', $lcPosition);
            }else{
                redirect(base_url());
            }
    }

    
    public function createPositionLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code'),
                    'name'  =>$this->input->post('name'),
                    'position'=>$this->input->post('position'),
                    'year' => $this->input->post('year'),
                    'semester' => $this->input->post('semester')
                ];

                $result = $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                $this->message = 'Lecture Position has been <b>created</b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }


    public function updatePositionLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code'),
                    'name'  =>$this->input->post('name'),
                    'position'=>$this->input->post('position'),
                    'year' => $this->input->post('year'),
                    'semester' => $this->input->post('semester')
                ];
                    
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                    
                $this->message = 'Lecture Position has been <b>updated</b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }

    public function deletePositionLecturer(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'code' => $this->input->post('code')
                ];
            }
            $this->curl->simple_delete($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            $this->message = 'Lecture Position has been <b>deleted</b>';
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
                    'position'    =>  $rowData[0][2],
                    'year'     =>  $rowData[0][3],
                    'semester'     =>  $rowData[0][4]
                );
                 
                //Match with the model and which function to execute
                $this->admin_model->createLecturerPosition($data);
                // use to delete the file as soon as it updates the database
                delete_files('C:/xampp/htdocs/Project-dataDosen/assets/uploads/csv');      
                    
            }
            
            redirect('adminController/positionLecturer','refresh');
            
    }

    public function template(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("code", "name" , "position","year", "semester");
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
        header('Content-Disposition: attachment;filename="positionLecturer.xlsx"');
        $object_writer->save('php://output');
    }
  
    public function export(){
        
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);

        // On excel columns
        $table_columns = array("code", "name" , "position","year", "semester");
        $column = 0;
        // Fill excel column values
        foreach($table_columns as $field){
          $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
          $column++;
        }
  
        $Position = $this->admin_model->getLecturerPosition();
        $excel_row = 2;
        
        // Fill the values of row based on excel's column 
        foreach($Position as $row){
          $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->code);
          $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->name);
          $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $row->position);
          $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, $row->year);
          $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, $row->semester);
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
        header('Content-Disposition: attachment;filename="Lecturer-Position.xlsx"');

        $object_writer->save('php://output');
  
    }


}

/* End of file researchGroup.php */


?>