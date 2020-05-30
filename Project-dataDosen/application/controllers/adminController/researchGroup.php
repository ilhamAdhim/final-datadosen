<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class researchGroup extends CI_Controller {

    
    public function __construct()
    {        
        parent::__construct();
        $this->API = 'http://localhost/Project-dataDosen/api/admins/rsGroup_API';
        $this->load->model('admin_model');
        $this->load->library('Excel');
        //Do your magic here
    }
    
    public function index()
    {
        if($this->session->userdata('loggedIn')){
            //tb_research_category , tb_research_sub_category
            $result =  $this->curl->simple_get($this->API);

            $researchGroup = [
                'response'  =>  json_decode($result, true),
                'title'     => "Research Group",
                'message'   => $this->message
            ];
            $this->load->view('template/header_admin', $researchGroup);
            $this->load->view('home/admins/content', $researchGroup);
            $this->load->view('template/footer_admin', $researchGroup);
        }else{
            redirect(base_url());
        }
    }

    
    public function createResearchGroup(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'rs_id'       =>  $this->input->post('rs_id'),
                    'research'    =>  $this->input->post('research'),
                ];
                    
                $result = $this->curl->simple_post($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                
                $this->message = 'Research Group has successfully <b> created </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
    }


    public function updateResearchGroup(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'rs_id'       =>  $this->input->post('rs_id'),
                    'research'    =>  $this->input->post('research'),
                ];
                    
                $this->curl->simple_put($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
                
                $this->message = 'Research Group has successfully <b> updated </b>';
                $this->index();
            }
        }else{
            redirect(base_url());
        }
        
    }

    public function deleteResearchGroup(){
        if($this->session->userdata('loggedIn')){
            if(isset($_POST['submit'])){
                $data = [
                    'rs_id' => $this->input->post('rs_id')
                ];
            }
            $this->curl->simple_delete($this->API , $data ,array(CURLOPT_BUFFERSIZE => 10));
            
            $this->message = 'Research Group has successfully <b> deleted </b>';
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
         
        if(! $this->upload->do_upload('file') )
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
                    'rs_id'       =>  $rowData[0][0],
                    'research'    =>  $rowData[0][1]
                );
                 
                //Match with the model and which function to execute
                $this->admin_model->createResearchGroups($data);
                
                // use to delete the file as soon as it updates the database
                delete_files('C:/xampp/htdocs/Project-dataDosen/assets/uploads/csv');      
                
            }
            redirect('adminController/researchGroup');
    }

    public function template(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
  
        // On excel columns
        $table_columns = array("rs_id","research");

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
        header('Content-Disposition: attachment;filename="researchGroup.xlsx"');
        $object_writer->save('php://output');
    }

    
    public function export(){
        $object = new PHPExcel();
  
        $object->setActiveSheetIndex(0);
  
        $table_columns = array("rs_id", "research");
  
        $column = 0;
  
        foreach($table_columns as $field){
  
          $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
  
          $column++;
  
        }
  
        $rsgroup = $this->admin_model->getResearchGroups();
  
        $excel_row = 2;
  
        foreach($rsgroup as $row){
  
          $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->rs_id);
  
          $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->research);
  
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
  
        header('Content-Disposition: attachment;filename="Research Group.xlsx"');
  
        $object_writer->save('php://output');
  
    }
}

/* End of file researchGroup.php */


?>