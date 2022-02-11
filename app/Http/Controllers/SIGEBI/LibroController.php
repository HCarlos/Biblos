<?php

namespace App\Http\Controllers\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\SIGEBI\LibroFilterRules;
use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\LibroRequest;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\InventarioLibro;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\TipoMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Response;

class LibroController extends Controller{

//    Este Controlador esta basado en la metodología Form In Line, que permite que sobre un mismo targuet se instalen otros target

    protected $tableName = "libros";
    protected $navCat = "Libros";
    protected $msg = "";
    protected $Request;

    public function __construct(){
        $this->middleware('auth');
    }

    protected function index(Request $request){

        $this->lim_max_reg = config('ibt.limite_maximo_registros');
        $this->lim_min_reg = config('ibt.limite_minimo_registros');
        $this->max_reg_con = config('ibt.maximo_registros_consulta');
        $this->min_reg_con = config('ibt.minimo_registros_consulta');

        $this->Request = $request;

        @ini_set( 'upload_max_size' , '16384M' );
        @ini_set( 'post_max_size', '16384M');
        @ini_set( 'max_execution_time', '960000' );

        $filters = new LibroFilterRules();
        $filters = $filters->filterRulesLibro($request);

        $items = Libro::query()
            ->filterBySearch($filters)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();

        $request->session()->put('items', $items);

        return view('SIGEBI.com.libro._libro_list',[
            'items'           => $items,
            'user'            => $user,
            'tituloTabla'     => 'Catálogo de Libros',
            'newItem'         => 'newLibro',
            'newItemWithData' => null,
            'breadcrumbs'     => null,
            'editItem'        => 'editLibro',
            'removeItem'      => 'removeLibro',
            'listItems'       => 'listaLibro',
            'IsModal'         => false,
            'inventarioItem'  => 'inventarioLibroList',
            'listPortadas'    => 'listPortadas',
        ]);
    }

    protected function newItem(){

        $user = Auth::user();
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        $breadcrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];
        //dd($breadcrumbs);
        return view('SIGEBI.com.libro._libro_edit',[
            "item"         => null,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales"  => $Editoriales,
            "titulo"       => "Nuevo registro ",
            'Route'        => 'createLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => true,
            'breadcrumbs'  => $breadcrumbs,
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
//        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
//        return Redirect::to('listaLibro');

//        return redirect()->route('listaLibro', [$request]);
        return redirect('editLibro/'.$id);

    }


    protected function editItem($Id){

        $Item = Libro::find($Id);
        $user = Auth::user();
        $TipoMaterial = TipoMaterial::query()->select('id','tipo_material as data')->orderBy('tipo_material') ->pluck('data','id')->toArray();
        $Editoriales  = Editoriale::query()->select('id','editorial as data')->orderBy('editorial') ->pluck('data','id')->toArray();
        $breadcrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];
        return view('SIGEBI.com.libro._libro_edit',[
            "item"         => $Item,
            "User"         => $user,
            "TipoMaterial" => $TipoMaterial,
            "Editoriales"  => $Editoriales,
            "titulo"       => "Editando el registro: ".$Id,
            'Route'        => 'updateLibro',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => false,
            'IsNew'        => false,
            'Id'           => $Id,
            'breadcrumbs'  => $breadcrumbs,
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
//        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
        return Redirect::to('listaLibro');


    }

    // ***************** ELIMINA AL USUARIO VIA AJAX ++++++++++++++++++++ //
    protected function removeItem($Id = 0, $dato1 = null, $dato2 = null){
        $code = 'OK';
        $msg = "Registro Eliminado con éxito!";
        $user = Libro::withTrashed()->findOrFail($Id);
        $user->forceDelete();
        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
    }














// ***************** MAUTOCOMPLETE DE UBICACIONES ++++++++++++++++++++ //
    protected function searchBook(Request $request)
    {
        ini_set('max_execution_time', 300000);
        $filters =$request->input('searchbook');
        $F           = new GeneralFunctios();
        $tsString    = $F->string_to_tsQuery( strtoupper($filters),' & ');

//        dd( $tsString );

        $filters = new LibroFilterRules();
        $filters = $filters->filterRulesLibro($request);

//dd($filters);

        $items = Libro::query()
            ->filterBySearch($filters)
            ->orderByDesc('id')
            ->get();

//        $items = Libro::query()
//            ->search($tsString)
//            ->orderBy('id')
//            ->get();

//       dd($items->count());

        $data=array();

        foreach ($items as $item) {

            //dd($item->id);

            $invlibs = InventarioLibro::query()->where('libro_id',$item->id)->get();

            //dd($invlibs);

            if ( $invlibs->count() > 0 ){
                $data[]=array(
                    'value'=>$item->titulo.'|'.$item->autor.'|'.$item->codebar,
                    'id'=>$item->id);

            }

        }
        if(count($data))
            return $data;
        else
            return ['value'=>'No se encontraron resultados','id'=>0];
//        return Response::json(['mensaje' => 'OK', 'data' => json_decode($data), 'status' => '200'], 200);

    }

// ***************** MAUTOCOMPLETE DE UBICACIONES ++++++++++++++++++++ //
    protected function getBook($Dato=0)
    {
        $items = Libro::find($Dato);
        return Response::json(['mensaje' => 'OK', 'data' => json_decode($items), 'status' => '200'], 200);

    }

    protected function showModalSearchBook(){

//        if (Auth::user()->isRole('ENLACE')){
//
//            $dep_id = intval(Auth::user()->IsEnlaceDependencia);
//            $Dependencias = Dependencia::all()->where('id',$dep_id)->sortBy('dependencia')->pluck('dependencia','id');
//            $Servicios = Servicio::whereHas('subareas', function($p) use ($dep_id) {
//                $p->whereHas("areas", function($q) use ($dep_id){
//                    return $q->where("dependencia_id",$dep_id);
//                });
//            })->orderBy('servicio')->get()->pluck('servicio','id');
//
//        }else{
//            $Dependencias = Dependencia::all()->sortBy('dependencia')->pluck('dependencia','id');
//            $Servicios    = Servicio::all()->where('')->sortBy('servicio')->pluck('servicio','id');
//        }
//
//        if(Auth::user()->isRole('Administrator|SysOp|USER_OPERATOR_ADMIN|USER_ARCHIVO_ADMIN')){
//            $Estatus      = Estatu::all()->sortBy('estatus');
//        }else{
//            $Estatus      = Estatu::all()->where('estatus_cve',1)->sortBy('estatus');
//        }
//
//        $Origenes     = Origen::all()->sortBy('origen');
//
//        $Capturistas  = User::query()->whereHas('roles', function ($q) {
//            return $q->whereIn('name',array('ENLACE','USER_OPERATOR_SIAC','USER_OPERATOR_ADMIN') );
//        } )
//            ->get()
//            ->sortBy('full_name_with_username_dependencia')
//            ->pluck('full_name_with_username_dependencia','id');
//
//        $user = Auth::user();
//        return view ('SIAC.denuncia.search.denuncia_search_panel',
//            [
//                'findDataInDenuncia' => 'findDataInDenuncia',
//                'dependencias'       => $Dependencias,
//                'capturistas'        => $Capturistas,
//                'servicios'          => $Servicios,
//                'estatus'            => $Estatus,
//                'origenes'           => $Origenes,
//                'items'              => $user,
//            ]
//        );
    }


    // ***************** MUESTRA EL MENU DE BUSQUEDA ++++++++++++++++++++ //
    protected function findDataInBook(Request $request)
    {

//        $filters = new GeneralFunctios();
//
//        $queryFilters = $filters->filterRulesDenuncia($request);
////        dd($queryFilters);
//
//        $items = Denuncia::query()
//            ->filterBy($queryFilters)
//            ->orderByDesc('id')
//            ->paginate($this->max_item_for_query);
//
//        $items->appends($queryFilters)->fragment('table');
//
//
//        $user = Auth::User();
//
//
//        $request->session()->put('items', $items);
//
//        return view('SIAC.denuncia.denuncia.denuncia_list',
//            [
//                'items'                               => $items,
//                'titulo_catalogo'                     => "Catálogo de " . ucwords($this->tableName),
//                'user'                                => $user,
//                'searchInListDenuncia'                => 'listDenuncias',
//                'respuestasDenunciaItem'              => 'listRespuestas',
//                'newWindow'                           => true,
//                'tableName'                           => $this->tableName,
//                'showEdit'                            => 'editDenuncia',
//                'newItem'                             => 'newDenuncia',
//                'removeItem'                          => 'removeDenuncia',
//                'showProcess1'                        => 'showDataListDenunciaExcel1A',
//                'searchAdressDenuncia'                => 'listDenuncias',
//                'showModalSearchDenuncia'             => 'showModalSearchDenuncia',
//                'findDataInDenuncia'                  => 'findDataInDenuncia',
//                'showEditDenunciaDependenciaServicio' => 'listDenunciaDependenciaServicio',
//                'imagenesDenunciaItem'                => 'listImagenes',
//
//
//            ]
//        );

    }


    public function viewCard($Id){

        $Libro = Libro::find($Id);
        $user  = Auth::user();

        return view('SIGEBI.com.inventario_libro._card_book_search',
            [
                "Libro"        => $Libro,
                "User"         => $user,
            ]
        );

    }




}
