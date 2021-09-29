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
            'tituloTabla'  => 'Listado de Libros',
            'newItem'      => 'newLibro',
            'editItem'     => 'editLibro',
            'removeItem'   => 'removeLibro',
            'listItems'    => 'listaLibro',
            'IsModal'      => true,
            'FullScreen'   => true,
        ]);
    }


    protected function newItem(){

        $user = Auth::user();
        //$TipoMaterial = TipoMaterial::select('id','tipo_material as data')->pluck('data','id');
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        //dd($TipoMaterial);
        return view('SIGEBI.com.libro._libro_edit_modal',[
            "item"         => null,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales" => $Editoriales,
            "TituloModal"  => "Nuevo registro ",
            'RouteModal'   => 'createLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => true,
        ]);

    }

    protected function createItem(LibroRequest $request) {
        //dd($request);
        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('newLibro')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        return redirect()->route('listaLibro');

    }


    protected function editItem($Id){

        $Item = Libro::find($Id);
        $user = Auth::user();
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();

        return view('SIGEBI.com.libro._libro_edit_modal',[
            "item"         => $Item,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales"  => $Editoriales,
            "TituloModal"  => "Editando el registro: ".$Id,
            'RouteModal'   => 'updateLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => false,
        ]);

    }

    protected function updateItem(LibroRequest $request) {
        //dd($request->all(['predeterminado']));

        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('editLibro')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        return redirect()->route('listaLibro');


    }


    // ***************** ELIMINA AL USUARIO VIA AJAX ++++++++++++++++++++ //
    protected function removeItem($Id = 0, $dato1 = null, $dato2 = null){
        $code = 'OK';
        $msg = "Registro Eliminado con éxito!";
        //dd($Id);
        $user = Libro::withTrashed()->findOrFail($Id);
        $user->forceDelete();

        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);

    }


}
