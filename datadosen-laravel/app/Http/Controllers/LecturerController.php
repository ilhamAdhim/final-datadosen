<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\AccountLecturer;
use App\LecturerModel;
use App\SubjectLecturer;
use App\positionLecturer;
use App\ResearcherLecturer;

class LecturerController extends Controller
{
    //CRUD + Download + Upload File Contract 

    public function index(){
        $data = [
            'code'      => Auth::user()->code,
            'info'      => LecturerModel::where('code',Auth::user()->code)->get(),
            'positions' => positionLecturer::where('code',Auth::user()->code)->get()
        ];

        // Restful Server for Laravel
        /* if(count($data) > 0){
            $res['message'] = "Success!";
            $res['values'] = $data;
            return response($res);
        }
        // if data is empty
        else{
            $res['message'] = "Kosong!";
            return response($res);
        } */
        
        return view('home',$data);
    }

    public function subjectList(){

        $subject = SubjectLecturer::where('code',Auth::user()->code)->get();

        $isSubjectDownloadable = SubjectLecturer::checkDownloadable($subject);

        $data = [
            'code' =>   Auth::user()->code,
            'subject' => $subject,
            'isDownloadable' => $isSubjectDownloadable
        ];
        
        return view('subjects',$data);
    }

    public function researchList(){
        $data = [
            'code'      => Auth::user()->code,
            'research' => ResearcherLecturer::where('code',Auth::user()->code)->get(),
            
        ];
        return view('research',$data);
    }

    public function editPassword(){
        $data = [
            'code'      => Auth::user()->code,
            'info' => AccountLecturer::where('code',Auth::user()->code)->get(),
        ];

        
        return view('changePassword',$data);
    }
    
    public function updatePassword(Request $request){
        $info = AccountLecturer::where('code',Auth::user()->code)->first();
        
        $info->password = Hash::make($request->password);
        $info->save();
        // Restful Server for Laravel If data is updated
        /* if($info->save()){
            $res['message'] = "Successfully updated!";
            $res['values'] = $info;
            return response($res);
        }else{
            $res['message'] = "Failed!";
            return response($res);
        } */
        
        return redirect('/home');
    }

    public function deleteAccount(){
        $user = AccountLecturer::where('code',Auth::user()->code);

        // Restful Server for Laravel If data is deleted
        /* if($user->delete()){
            $res['message'] = "Successfully deleted!";
            return response($res);
        }else{
            $res['message'] = "Failed!";
            return response($res);
        } */
        $user->delete();
        return redirect('/login');
    }
}
