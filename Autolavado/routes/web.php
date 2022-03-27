<?php

use Illuminate\Support\Facades\Route;
use App\Models\Clientes;
use App\Models\Trabajadores;

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

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/clientes',[App\Http\Controllers\Cliente::class, 'index']);
Route::get('/servicio',[App\Http\Controllers\Servicio::class, 'index']);
Route::get('/trabajador',[App\Http\Controllers\Trabajador::class, 'index']);
Route::get('/vehiculo',[App\Http\Controllers\Vehiculo::class, 'index']);
Route::get('/venta',[App\Http\Controllers\Venta::class, 'index']);


// Route::get('/vclientes', function () {
//     $cliente=Clientes::all();
    
//     foreach($cliente as $clientes){
//         echo "Nombre ".$clientes->nombre." Apellidos: "
//         .$clientes->apaterno." Direccion: ".$clientes->direccion."<br>";
//     }

    
// });

// Route::get('/vtrabajadores', function () {
//     $trabajador=Trabajadores::all();
    
//     foreach($trabajador as $trabajadores){
//         echo "Nombre ".$trabajadores->nombre." Apellidos: "
//         .$trabajadores->apaterno." Direccion: ".$trabajadores->direccion."<br>";
//     }

    
// });