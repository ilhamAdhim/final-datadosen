<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/lecturer/{code}', 'LecturerController@index');

Route::get('/lecturer/{code}/position', 'LecturerController@positionList');

Route::get('/lecturer/{code}/subject', 'LecturerController@subjectList');

Route::get('/lecturer/{code}/research', 'LecturerController@researchList');

Route::get('/lecturer/{code}/changePassword', 'LecturerController@editPassword');

Route::post('/lecturer/{code}/updatePassword', 'LecturerController@updatePassword');
