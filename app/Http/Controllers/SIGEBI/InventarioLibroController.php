<?php

namespace App\Http\Controllers\SIGEBI;

use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\InventarioLibroRequest;
use App\Http\Requests\SIGEBI\InventarioLibroReservaRequest;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\HistorialLibro;
use App\Models\SIGEBI\InventarioLibro;
use App\Models\SIGEBI\Libro;
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


    protected function showModalReservar($IL){

        $Item = InventarioLibro::find($IL);
        $user  = Auth::user();
        return view('SIGEBI.com.inventario_libro.apartados._apartado_new',
            [
                'TituloModal'     => 'Reservar '.$Item->id,
                'RouteModal'      => 'saveReservation',
                'Method'          => 'POST',
                'IsNew'           => true,
                'IsUpload'        => false,
                'newItemWithData' => null,
                'breadcrumbs'     => null,
                'item'            => $Item,
                'User'            => $user,
            ]
        );

    }

    protected function saveReservation(InventarioLibroReservaRequest $request){
        $Obj = $request->manageApartados();
        $code = 'OK';
        $msg = "Libro Reservado con éxito!";
        session(['msg' => $this->msg]);
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
    }








    protected function showModalPrestar($Id){

        $Item = InventarioLibro::find($Id);
        $user  = Auth::user();
        return view('SIGEBI.com.inventario_libro.prestamos._prestamo_new',
            [
                'TituloModal'     => 'Prestar el Item ID: '.$Item->id,
                'RouteModal'      => 'savePrestar',
                'Method'          => 'POST',
                'IsNew'           => true,
                'IsUpload'        => false,
                'newItemWithData' => null,
                'breadcrumbs'     => null,
                'item'            => $Item,
                'User'            => $user,
            ]
        );

    }


    protected function savePrestar(InventarioLibroReservaRequest $request){
        $Obj = $request->managePrestamos();
        $code = 'OK';
        $msg = "Libro Prestado con éxito!";
        session(['msg' => $this->msg]);
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
    }







    protected function showModalEntregar($Id){

        $Item = InventarioLibro::find($Id);
        $user  = Auth::user();
        return view('SIGEBI.com.inventario_libro.entregas._entrega_new',
            [
                'TituloModal'     => 'Entregar el Item ID: '.$Item->id,
                'RouteModal'      => 'saveEntregar',
                'Method'          => 'POST',
                'IsNew'           => true,
                'IsUpload'        => false,
                'newItemWithData' => null,
                'breadcrumbs'     => null,
                'item'            => $Item,
                'User'            => $user,
            ]
        );

    }


    protected function saveEntregar(InventarioLibroReservaRequest $request){
        $Obj = $request->manageEntregas();
        $code = 'OK';
        $msg = "Libro Entregado con éxito!";
        session(['msg' => $this->msg]);
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
    }


    protected function saveRestablecerDisponible($Id){
        $IL = InventarioLibro::find($Id);
        $User = Auth::user();
//        dd($IL);
        $Item = [
            "fecha_apartado"             => null,
            "fecha_apartado_vencimiento" => null,
            "fecha_prestamo"             => null,
            "fecha_prestamo_vencimiento" => null,
            "fecha_entrega"              => null,
            "fecha_entrega_vencimiento"  => null,
            "observaciones"              => "",
            "status_libro"               => 1,
        ];
        $IL->update($Item);
        HistorialLibro::create([
            'libro_id'           => $IL->libro_id,
            'inventariolibro_id' => $IL->id,
            'user_id'            => $User->id,
            'fecha'              => now(),
            'tipo_movto'         => "RESTABLECIDO::DISPONIBLE",
            'observaciones'      => "System",
            'creado_por_id'      => $User->id,
        ]);


        return Response::json(['mensaje' => "Operación realizada con éxito", 'data' => "OK", 'status' => '200'], 200);
    }






}
