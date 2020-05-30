<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'LecturerController@index')->name('home');

Route::get('/lecturer/{code}/position', 'LecturerController@positionList');

Route::get('/lecturer/{code}/subject', 'LecturerController@subjectList');

Route::get('/lecturer/{code}/research', 'LecturerController@researchList');

Route::get('/lecturer/{code}/changePassword', 'LecturerController@editPassword');

Route::post('/lecturer/{code}/updatePassword', 'LecturerController@updatePassword');

Route::get('/lecturer/{code}/deleteAccount', 'LecturerController@deleteAccount');
