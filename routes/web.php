<?php

use App\Http\Controllers\Catalogos\Alumnos\AlumnosController;
use App\Http\Controllers\Catalogos\Familias\FamiliasController;
use App\Http\Controllers\Catalogos\Profesores\ProfesorController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SIGEBI\EditorialController;
use App\Http\Controllers\SIGEBI\InventarioLibroController;
use App\Http\Controllers\SIGEBI\LibroController;
use App\Http\Controllers\SIGEBI\PortadaController;
use App\Http\Controllers\SIGEBI\TipoMaterialController;
use App\Http\Controllers\Storage\ProfileStorageController;
use App\Http\Controllers\Storage\StorageExternalFilesController;
use App\Http\Controllers\Storage\StorageListaCatalogosController;
use App\Http\Controllers\User\RoleController;
use App\Http\Controllers\User\UserController;
use Illuminate\Support\Facades\Auth;
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

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::group(['middleware' => 'auth'], function () {

//    Route::post('logout', 'Auth\LoginController@logout')->name('logout');

    Route::get('home',  [HomeController::class, 'index'])->name('home');

    Route::get('editProfile/{Id}',[UserController::class,'editProfile'])->name('editProfile');
    Route::put('updateProfile',[UserController::class,'updateProfile'])->name('updateProfile');
    Route::get('editPasswordUser/{Id}',[UserController::class,'editPasswordUser'])->name('editPasswordUser');
    Route::put('updatePasswordUser',[UserController::class,'updatePasswordUser'])->name('updatePasswordUser');
    Route::get('editFotodUser/{Id}',[UserController::class,'editFotodUser'])->name('editFotodUser');
    Route::post('updateFotodUser',[ProfileStorageController::class,'subirArchivoProfile'])->name('updateFotodUser');

    // ALUMNOS
//    Route::get('listaAlumnos/{Id}',[AlumnosController::class,'index'])->name('listaAlumnos');
//    Route::get('editAlumno/{Id}',[AlumnosController::class,'editItem'])->name('editAlumno');
//    Route::put('updateAlumno',[AlumnosController::class,'updateItem'])->name('updateAlumno');
//    Route::get('removeAlumno/{Id}/{Dato1}/{Dato2}',[AlumnosController::class,'removeItem'])->name('removeAlumno');

    // PROFESORES
//    Route::get('listaProfesores/{Id}',[ProfesorController::class,'index'])->name('listaProfesores');
//    Route::get('editProfesor/{Id}',[ProfesorController::class,'editItem'])->name('editProfesor');
//    Route::get('removeProfesor/{Id}/{Dato1}/{Dato2}',[ProfesorController::class,'removeItem'])->name('removeProfesor');

    // TIPO DE MATERIAL
    Route::get('listaTipoMaterial',[TipoMaterialController::class,'index'])->name('listaTipoMaterial');
    Route::get('newTipoMaterial',[TipoMaterialController::class,'newItem'])->name('newTipoMaterial');
    Route::post('createTipoMaterial',[TipoMaterialController::class,'createItem'])->name('createTipoMaterial');
    Route::get('editTipoMaterial/{Id}',[TipoMaterialController::class,'editItem'])->name('editTipoMaterial');
    Route::put('updateTipoMaterial',[TipoMaterialController::class,'updateItem'])->name('updateTipoMaterial');
    Route::get('removeTipoMaterial/{Id}/{Dato1}/{Dato2}',[TipoMaterialController::class,'removeItem'])->name('removeTipoMaterial');

    // EDITORIAL
    Route::get('listaEditorial',[EditorialController::class,'index'])->name('listaEditorial');
    Route::get('newEditorial',[EditorialController::class,'newItem'])->name('newEditorial');
    Route::post('createEditorial',[EditorialController::class,'createItem'])->name('createEditorial');
    Route::get('editEditorial/{Id}',[EditorialController::class,'editItem'])->name('editEditorial');
    Route::put('updateEditorial',[EditorialController::class,'updateItem'])->name('updateEditorial');
    Route::get('removeEditorial/{Id}/{Dato1}/{Dato2}',[EditorialController::class,'removeItem'])->name('removeEditorial');

    // LIBRO
    Route::get('listaLibro',[LibroController::class,'index'])->name('listaLibro');
    Route::get('newLibro',[LibroController::class,'newItem'])->name('newLibro');
    Route::post('createLibro',[LibroController::class,'createItem'])->name('createLibro');
    Route::get('editLibro/{Id}',[LibroController::class,'editItem'])->name('editLibro');
    Route::put('updateLibro',[LibroController::class,'updateItem'])->name('updateLibro');
    Route::get('removeLibro/{Id}/{Dato1}/{Dato2}',[LibroController::class,'removeItem'])->name('removeLibro');

    // LIBRO
    Route::get('inventarioLibroList/{Id}',[InventarioLibroController::class,'index'])->name('inventarioLibroList');
    Route::get('newInventarioLibro',[InventarioLibroController::class,'newItem'])->name('newInventarioLibro');
    Route::post('createInventarioLibro',[InventarioLibroController::class,'createItem'])->name('createInventarioLibro');
    Route::get('editInventarioLibro/{Id}',[InventarioLibroController::class,'editItem'])->name('editInventarioLibro');
    Route::put('updateInventarioLibro',[InventarioLibroController::class,'updateItem'])->name('updateInventarioLibro');
    Route::get('removeInventarioLibro/{Id}/{Dato1}/{Dato2}',[InventarioLibroController::class,'removeItem'])->name('removeInventarioLibro');


    // USUARIOS
    Route::get('listaUsuarios',[UserController::class,'index'])->name('listaUsuarios');
    Route::get('newUsuario',[UserController::class,'newItem'])->name('newUsuario');
    Route::post('createUsuario/',[UserController::class,'createItem'])->name('createUsuario');
    Route::get('editUsuario/{Id}',[UserController::class,'editItem'])->name('editUsuario');
    Route::put('updateUsuario/',[UserController::class,'updateItem'])->name('updateUsuario');
    Route::get('removeUsuario/{Id}/{Dato1}/{Dato2}',[UserController::class,'removeItem'])->name('removeUsuario');
    Route::get('getUsernameNext/{Abreviatura}',[UserController::class,'getUsernameNext'])->name('getUsernameNext');
    Route::get('viewSearchModal',[UserController::class,'viewSearchModal'])->name('viewSearchModal');
    Route::get('addRoleItem/{User}',[UserController::class,'addRoleItem'])->name('addRoleItem');
    Route::post('createRoleUsuario/',[UserController::class,'createRoleItem'])->name('createRoleUsuario');
    Route::get('removeRoleUsuario/{Id}/{Dato1}/{Dato2}',[UserController::class,'removeRoleItem'])->name('removeRoleUsuario');

    // Roles
    Route::get('listaRoles',[RoleController::class,'index'])->name('listaRoles');
    Route::get('newRole',[RoleController::class,'newItem'])->name('newRole');
    Route::post('createRole/',[RoleController::class,'createItem'])->name('createRole');
    Route::get('editRole/{Id}',[RoleController::class,'editItem'])->name('editRole');
    Route::put('updateRole/',[RoleController::class,'updateItem'])->name('updateRole');
    Route::get('removeRole/{Id}',[RoleController::class,'removeItem'])->name('removeRole');


    // ARCHIVOS

    Route::get('archivos_config',[StorageExternalFilesController::class,'archivos_config'])->name('archivos_config');
    Route::post('subirArchivoBase', [StorageExternalFilesController::class,'subirArchivoBase'])->name('subirArchivoBase');
    Route::get('quitarArchivoBase/{driver}/{archivo}', [StorageExternalFilesController::class,'quitarArchivoBase'])->name('quitarArchivoBase');

    // MS EXCEL

    Route::get('listUsuariosToXlsx',[StorageListaCatalogosController::class,'listUsuariosToXlsx'])->name('listUsuariosToXlsx');
    Route::get('listFamiliasToXlsx',[StorageListaCatalogosController::class,'listFamiliasToXlsx'])->name('listFamiliasToXlsx');


    //PORTADAS
    Route::get('listPortadas/{Id}', [PortadaController::class,'index'])->name('listPortadas');
    Route::get('portadaLibroNew/{Id}',[PortadaController::class,'newItem'])->name('portadaLibroNew');
    Route::post('portadaLibroCreate',[PortadaController::class,'createItem'])->name('portadaLibroCreate');
    Route::get('removePortadaLibro/{Id}/{Dato1}/{Dato2}',[PortadaController::class,'removeItem'])->name('removePortadaLibro');

    //INVENTARIO LIBROS
    Route::get('listaInventarioLibroList/{Id}', [InventarioLibroController::class,'index'])->name('listaInventarioLibroList');
    Route::get('inventarioLibroNew/{Id}',[InventarioLibroController::class,'newItem'])->name('inventarioLibroNew');
    Route::post('inventarioLibroCreate',[InventarioLibroController::class,'createItem'])->name('inventarioLibroCreate');
    Route::get('inventarioLibroEdit/{Id}',[InventarioLibroController::class,'editItem'])->name('inventarioLibroEdit');
    Route::put('inventarioLibroUpdate',[InventarioLibroController::class,'updateItem'])->name('inventarioLibroUpdate');
    Route::get('removeInventarioLibro/{Id}/{Dato1}/{Dato2}',[InventarioLibroController::class,'removeItem'])->name('removeInventarioLibro');







    /*
        Route::get('editProfilePassword/', 'User\UserController@editProfilePassword')->name('editProfilePassword/');
        Route::put('updateProfilePassword/', 'Catalogos\User\UserDataController@updateProfilePassword')->name('updateProfilePassword/');
        Route::get('editProfilePhoto/', 'Catalogos\User\UserDataController@editProfilePhoto')->name('editProfilePhoto/');
        Route::post('subirFotoProfile/', 'Storage\StorageProfileController@subirArchivoProfile')->name('subirArchivoProfile/');
        Route::get('quitarFotoProfile/', 'Storage\StorageProfileController@quitarArchivoProfile')->name('quitarArchivoProfile/');
    */



});
