<?php

namespace App\Http\Controllers\SIGEBI;

use App\Filters\SIGEBI\LibroFilterRules;
use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\TipoMaterialRequest;
use App\Models\SIGEBI\TipoMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;

class TipoMaterialController extends Controller{

    protected $tableName = "tipoaterial";
    protected $navCat = "tipo de material";
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

        $filters = new LibroFilterRules();
        $filters = $filters->filterRulesUserDB($request);

        $items = TipoMaterial::query()
            ->filterBySearch($filters)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();
        $items->appends($filters)->fragment('table');

        $request->session()->put('items', $items);

        return view('SIGEBI.com.tipo_material._tipo_material_list',[
            'items'        => $items,
            'user'         => $user,
            'tituloTabla'  => 'Catálogo de Tipos de Materiales',
            'newItem'      => 'newTipoMaterial',
            'editItem'     => 'editTipoMaterial',
            'removeItem'   => 'removeTipoMaterial',
            'listItems'    => 'listaTipoMaterial',
            'IsModal'      => true,

        ]);
    }


    protected function newItem(){

        $user = Auth::user();
        //dd($roles);
        return view('SIGEBI.com.tipo_material._tipo_material_edit_modal',[
            "item"        => null,
            "User"        => $user,
            "TituloModal" => "Nuevo registro ",
            'RouteModal'  => 'createTipoMaterial',
            'Method'      => 'POST',
            'msg'         => $this->msg,
            'IsUpload'    => false,
            'IsNew'       => true,
        ]);

    }

    protected function createItem(TipoMaterialRequest $request) {
        //dd($request);
        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('newTipoMaterial')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        return redirect()->route('listaTipoMaterial');
    }


    protected function editItem($Id){

        $Item = TipoMaterial::find($Id);
        $user = Auth::user();

        return view('SIGEBI.com.tipo_material._tipo_material_edit_modal',[
            "item"        => $Item,
            "User"        => $user,
            "TituloModal" => "Editando el registro: ".$Id,
            'RouteModal'  => 'updateTipoMaterial',
            'Method'      => 'POST',
            'msg'         => $this->msg,
            'IsUpload'    => false,
            'IsNew'       => false,
        ]);

    }

    protected function updateItem(TipoMaterialRequest $request) {
        $Obj = $request->manage();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect('editTipoMaterial')
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        return redirect()->route('listaTipoMaterial');

    }


    // ***************** ELIMINA AL USUARIO VIA AJAX ++++++++++++++++++++ //
    protected function removeItem($Id = 0, $dato1 = null, $dato2 = null){
        $code = 'OK';
        $msg = "Registro Eliminado con éxito!";
        //dd($Id);
        $user = TipoMaterial::withTrashed()->findOrFail($Id);
        $user->forceDelete();

        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);

    }





}
