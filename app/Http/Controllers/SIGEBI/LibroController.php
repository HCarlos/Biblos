<?php

namespace App\Http\Controllers\SIGEBI;

use App\Filters\User\UserFilterRules;
use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\LibroRequest;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\TipoMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;

class LibroController extends Controller{

//    Este Controlador esta basado en la metodología Form In Line, que permite que sobre un mismo targuet se instalen otros target

    protected $tableName = "libros";
    protected $navCat = "Libros";
    protected $msg = "";

    public function __construct(){
        $this->middleware('auth');
    }

    protected function index(Request $request){

        $this->lim_max_reg = config('ibt.limite_maximo_registros');
        $this->lim_min_reg = config('ibt.limite_minimo_registros');
        $this->max_reg_con = config('ibt.maximo_registros_consulta');
        $this->min_reg_con = config('ibt.minimo_registros_consulta');

        @ini_set( 'upload_max_size' , '16384M' );
        @ini_set( 'post_max_size', '16384M');
        @ini_set( 'max_execution_time', '960000' );

        $filters = new UserFilterRules();
        $filters = $filters->filterRulesUserDB($request);

        $items = Libro::query()
            ->filterBySearch($filters)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();
        $items->appends($filters)->fragment('table');

        $request->session()->put('items', $items);

        return view('SIGEBI.com.libro._libro_list',[
            'items'        => $items,
            'user'         => $user,
            'tituloTabla'  => 'Catálogo de Libros',
            'newItem'      => 'newLibro',
            'editItem'     => 'editLibro',
            'removeItem'   => 'removeLibro',
            'listItems'    => 'listaLibro',
            'IsModal'      => false,
            'FormInline'   => 'contentMain-contentPropertie',
            'inventarioItem' => 'inventarioLibroList'
        ]);
    }


    protected function newItem(){

        $user = Auth::user();
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        return view('SIGEBI.com.libro._libro_edit',[
            "item"         => null,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales" => $Editoriales,
            "titulo"  => "Nuevo registro ",
            'Route'   => 'createLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => true,
            'FormInline'   => 'contentMain-contentPropertie',
        ]);

    }

    protected function createItem(LibroRequest $request) {
        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('newLibro')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        $code = 'OK';
        $msg = "Registro Guardado con éxito!";
        session(['msg' => $this->msg]);
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);

    }


    protected function editItem($Id){

        $Item = Libro::find($Id);
        $user = Auth::user();
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        return view('SIGEBI.com.libro._libro_edit',[
            "item"         => $Item,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales"  => $Editoriales,
            "titulo"  => "Editando el registro: ".$Id,
            'Route'   => 'updateLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => false,
            'FormInline'   => 'contentMain-contentPropertie',
        ]);

    }

    protected function updateItem(LibroRequest $request) {

        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('editLibro')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        $code = 'OK';
        $msg = "Registro Guardado con éxito!";
        session(['msg' => $this->msg]);
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);


    }

    // ***************** ELIMINA AL USUARIO VIA AJAX ++++++++++++++++++++ //
    protected function removeItem($Id = 0, $dato1 = null, $dato2 = null){
        $code = 'OK';
        $msg = "Registro Eliminado con éxito!";
        $user = Libro::withTrashed()->findOrFail($Id);
        $user->forceDelete();
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
    }

}
