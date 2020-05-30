<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccountLecturer extends Model
{
    //
    protected $table = 'users';
    protected $fillable = ['code','username','password','email','phone','photo'];
}
