<?php

namespace App\Http\Controllers\SIGEBI;

use App\Filters\User\UserFilterRules;
use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\EditorialRequest;
use App\Http\Requests\SIGEBI\InventarioLibroRequest;
use App\Http\Requests\SIGEBI\LibroRequest;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\InventarioLibro;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\TipoMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;

class InventarioLibroController extends Controller{



    protected $tableName = "inventariolibros";
    protected $navCat = "Inventario Libros";
    protected $msg = "";
    protected $Request;
    protected $BreadCrumbs;

    public function __construct(){
        $this->middleware('auth');
    }

    protected function index($Id){

        $this->lim_max_reg = config('ibt.limite_maximo_registros');
        $this->lim_min_reg = config('ibt.limite_minimo_registros');
        $this->max_reg_con = config('ibt.maximo_registros_consulta');
        $this->min_reg_con = config('ibt.minimo_registros_consulta');

        @ini_set( 'upload_max_size' , '16384M' );
        @ini_set( 'post_max_size', '16384M');
        @ini_set( 'max_execution_time', '960000' );

        //dd($Id);

        $this->Request = $Id;


        $filters = ['libro_id'=>$Id];
        $libro = Libro::find($Id);
        $items = InventarioLibro::query()
           ->where('libro_id',$Id)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();
        $Libro = Libro::find($Id);
        Session::put('items', $items);

        $this->BreadCrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];

        return view('SIGEBI.com.inventario_libro._inventario_libro_list',
            [
                'items'           => $items,
                'user'            => $user,
                'Id'              => $Id,
                'titulo'          => 'Ejemplares de '.$libro->titulo,
                'listItems'       => 'listaLibro',
                'IsModal'         => false,
                'newItemWithData' => 'inventarioLibroNew',
                'editItem'        => 'inventarioLibroEdit',
                'createItem'      => 'createInventarioLibro',
                'removeItem'      => 'removeInventarioLibro',
                'breadcrumbs'     => $this->BreadCrumbs,
            ]
        );
    }



    protected function newItem($libro_id){

        $user  = Auth::user();
        $Libro = Libro::find($libro_id);
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        $this->BreadCrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];
        $this->BreadCrumbs[] = (object) ['titulo'=>'libro '.$libro_id,'url'=>'listaInventarioLibroList', 'request'=>$libro_id];

        //dd($Libro);
        return view('SIGEBI.com.inventario_libro._inventario_libro_new',
            [
                "Libro"        => $Libro,
                "Editoriales"  => $Editoriales,
                "User"         => $user,
                "titulo"       => "Nuevo Libro",
                'Route'        => 'inventarioLibroCreate',
                'Method'       => 'POST',
                'msg'          => $this->msg,
                'IsUpload'     => true,
                'IsNew'        => true,
                'breadcrumbs'  => $this->BreadCrumbs,
            ]
        );

    }

    protected function createItem(InventarioLibroRequest $request){

        $Data = $request->all(['libro_id']);
        $Obj = $request->manageInventarioLibro();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect()->route('inventarioLibroNew',['Id' => $Data['libro_id']] )
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        $code = 'OK';
        $msg = "Registro Guardado con éxito!";
        session(['msg' => $this->msg]);
        return redirect()->route('listaInventarioLibroList',['Id' => $Data['libro_id']] );

    }

    protected function editItem($Id){

        $Item = InventarioLibro::find($Id);
        $Libro = Libro::find($Item->libro_id);
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        $user  = Auth::user();
        $this->BreadCrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];
        $this->BreadCrumbs[] = (object) ['titulo'=>'libro '.$Item->libro_id,'url'=>'listaInventarioLibroList', 'request'=>$Item->libro_id];

//        dd($Item);

        return view('SIGEBI.com.inventario_libro._inventario_libro_new',
            [
                'item'         => $Item,
                "Libro"        => $Libro,
                "Editoriales"  => $Editoriales,
                "User"         => $user,
                "titulo"       => "Editando el Libro ",
                'Route'        => 'inventarioLibroUpdate',
                'Method'       => 'POST',
                'msg'          => $this->msg,
                'IsUpload'     => true,
                'IsNew'        => false,
                'breadcrumbs'  => $this->BreadCrumbs,
            ]
        );

    }

    protected function updateItem(InventarioLibroRequest $request) {

        $Data = $request->all(['id','libro_id']);
        $Obj = $request->manageInventarioLibro();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect()->route('inventarioLibroEdit',['Id' => $Data['id']] )
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        $code = 'OK';
        $msg = "Registro Guardado con éxito!";
        session(['msg' => $this->msg]);
        return redirect()->route('listaInventarioLibroList',['Id' => $Data['libro_id']] );

    }


    // ***************** ELIMINA AL USUARIO VIA AJAX ++++++++++++++++++++ //
    protected function removeItem($Id = 0, $Dato1 = null, $Dato2 = null){
        $code = 'OK';
        $msg = "Registro Eliminado con éxito!";
        //dd($Id);
        $user = InventarioLibro::withTrashed()->findOrFail($Id);
        $user->forceDelete();

        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);

    }


}
