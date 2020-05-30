<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubjectLecturer extends Model
{
    //
    protected $table = 'tb_lec_hourdist';
    
    protected function checkDownloadable($data){
        $result = [];

        foreach ($data as $key => $value) {
            // Fetch info from tb_contract_files
            $source = SubjectLecturer::select('select subject_code from tb_lec_hourdist where subject_code = ?',[$value->subject_code]);
            $isExist = empty($source) ? false : true;
            array_push($result, $isExist);
        }
        return $result;
    }
}
