<?php

namespace App\Http\Controllers\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Http\Controllers\Controller;
use App\Http\Requests\SIGEBI\PortadaRequest;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\Portada;
use App\Models\SIGEBI\TipoMaterial;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Classes\MessageAlertClass;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Response;

class PortadaController extends Controller{



//************************************************************************************
//************             R   E   S   P   U   E   S   T   A   S                    ***
//***************************************************************+++++++++++++++++++**

    protected $tableName = "portadas";
    protected $disk = 'portada';
    protected $msg = "";
    protected $F;
    protected $Request;
    protected $BreadCrumbs;

    // Obtiene el Listado de Portadas
    protected function index($Id)
    {
        $this->Request = $Id;

        $libro = Libro::find($Id);
        $items = Portada::select()
            ->whereHas('libros', function ($q) use ($Id) {
                return $q->where('libro_id',$Id);
            })
            ->orderByDesc('id')
            ->paginate();
        $user = Auth::User();

        $this->BreadCrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];

        return view('SIGEBI.com.portada._portada_list',
            [
                'items'           => $items,
                'user'            => $user,
                'Id'              => $Id,
                'tituloTabla'     => 'Portadas de '.$libro->titulo,
                'listItems'       => 'listaLibro',
                'IsModal'         => false,
                'FormInline'      => 'contentMain-contentPropertie',
                'newItemWithData' => 'portadaLibroNew',
                'createItem'      => 'createPortadaLibro',
                'removeItem'      => 'removePortadaLibro',
                'breadcrumbs'     => $this->BreadCrumbs,
            ]
        );

    }


    protected function newItem($libro_id){

        $user = Auth::user();
        $Libro = Libro::find($libro_id);
        $this->BreadCrumbs[] = (object) ['titulo'=>'libros','url'=>'listaLibro', 'request'=>$this->Request];
        $this->BreadCrumbs[] = (object) ['titulo'=>'libro '.$libro_id,'url'=>'listPortadas', 'request'=>$libro_id];
        //dd($Libro);
        return view('SIGEBI.com.portada._portada_new',[
            "item"         => $Libro,
            "User"         => $user,
            "titulo"       => "Nueva Portada",
            'Route'        => 'portadaLibroCreate',
            'Method'       => 'POST',
            'msg'          => $this->msg,
            'IsUpload'     => true,
            'IsNew'        => true,
            'breadcrumbs'     => $this->BreadCrumbs,
        ]);

    }

    protected function createItem(PortadaRequest $request){
        $Data = $request->all(['libro_id']);
        $Obj = $request->managePortadaLibro();
        if (!is_object($Obj)) {
            $id = 0;
            return redirect()->route('portadaLibroNew',['Id' => $Data['libro_id']] )
                ->withErrors($Obj)
                ->withInput();
        }else{
            $id = $Obj->id;
        }
        $code = 'OK';
        $msg = "Registro Guardado con éxito!";
        session(['msg' => $this->msg]);
//        return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);
        return redirect()->route('listPortadas',['Id' => $Data['libro_id']] );
    }


    // ***************** ELIMIN$url->A EL ITEM VIA AJAX ++++++++++++++++++++ //
        protected function removeItem($Id){

            $code = 'OK';
            $msg = "Registro Eliminado con éxito!";
            $port = Portada::withTrashed()->findOrFail($Id);
            $port->forceDelete();

            return Response::json(['mensaje' => $msg, 'data' => $code, 'status' => '200'], 200);

        }

    /*

    // ***************** ELIMINA LOS REGISTROS SELECCIONADOS VIA AJAX ++++++++++++++++++++ //
        protected function removeItems($arrIds)
        {
            $valRet = Response::json(['mensaje' => 'none', 'data' => 'OK', 'status' => '200'], 200);
            foreach ($arrIds as $id){
                $item = Portada::withTrashed()->findOrFail( $id );
                if (isset($item)) {
                    try{
                        if (!$item->trashed()) {
                            $item->forceDelete();
                        } else {
                            $item->forceDelete();
                        }
                        $item->users()->detach($item->user__id);
                        $den = Denuncia::find($item->denuncia__id);
                        $den->imagenes()->detach($item->id);

                        $this->F = new FuncionesController();
                        $this->F->deleteImageDropZone($item->image,$this->disk);
                        $this->F->deleteImageDropZone($item->image_thumb,$this->disk);
                        $valRet =  Response::json(['mensaje' => 'Registro eliminado con éxito', 'data' => 'OK', 'status' => '200'], 200);

                    }catch (QueryException $e){
                        $Msg = new MessageAlertClass();
                        $Msg->Message($e);
                    }
                } else {
                    $valRet =  Response::json(['mensaje' => 'Se ha producido un error.', 'data' => 'Error', 'status' => '200'], 200);
                }
            }
            return $valRet;
        }

        protected function showModalPortadaNew($denuncia_id){
            $user = Auth::user();
            return view ('denuncia.images.imagene_upload',
                [
                    'savePortadaDen'=>'savePortadaDen',
                    'denuncia_id' => $denuncia_id,
                    'removeItem' => 'removePortada',
                    'user' => $user,
                ]
            );
        }

        protected function showModalPortadaEdit($Id){
            $user = Auth::user();
            $item = Portada::find($Id);
            //dd();
            //dd( Input::get('images') );

            return view ('denuncia.images.imagene_edit_data',
                [
                    'savePortadaDen'=>'savePortadaDen',
                    'item' => $item,
                    'user' => $user,
                ]
            );
        }

        protected function savePortadaDen(PortadaRequest $request){
            $data = $request->only(['id']);
            if ( $data['id'] == 0 ){
                $item = $request->manage();
            }else{
                $request->manageEdit();
                $item = Portada::find($data['id']);
            }
            if (isset($item)){
    //            dd($item);
                return Response::json(['mensaje' => 'Información guardada con éxito!', 'data' => 'OK', 'status' => '200','filename'=>$item->image,'Id'=>$item->id], 200);
            }else{
                return Response::json(['mensaje' => 'Hubo un error!', 'data' => $item, 'status' => '422','filename'=>'','Id'=>-1], 200);
            }
        }

    // IMAGEN A IMAGEN

        protected function ImagenAImagenNew($denuncia_id,$imagen_id){
            $user = Auth::user();
            return view ('denuncia.imagen_a_imagen.imagen_a_imagen_upload',
                [
                    'saveImagenAImagenDen' => 'saveImagenAImagenDen',
                    'denuncia_id'    => $denuncia_id,
                    'imagen_id'      => $imagen_id,
                    'removeItem'     => 'removeImagenParent',
                    'user' => $user,
                ]
            );
        }

        protected function saveImagenAImagenDen(ImagenAImagenRequest $request){
            $item = $request->manage();
            if (isset($item)){
                return Response::json(['mensaje' => 'Información guardada con éxito!', 'data' => 'OK', 'status' => '200'], 200);
            }else{
                return Response::json(['mensaje' => 'Hubo un error!', 'data' => $item, 'status' => '422'], 200);
            }
        }


        protected function removeImagenParent($id)
        {
            $valRet = Response::json(['mensaje' => 'none', 'data' => 'OK', 'status' => '200'], 200);
    //        foreach ($arrIds as $id){
            $item = Portada::withTrashed()->findOrFail( $id );
            if (isset($item)) {
                try{
                    if (!$item->trashed()) {
                        $item->forceDelete();
                    } else {
                        $item->forceDelete();
                    }
                    $item->users()->detach($item->user__id);
                    $den = Denuncia::find($item->denuncia__id);
                    $den->imagenes()->detach($item->id);

                    $this->F = new FuncionesController();
                    $this->F->deleteImageDropZone($item->image,$this->disk);
                    $this->F->deleteImageDropZone($item->image_thumb,$this->disk);
                    $valRet =  Response::json(['mensaje' => 'Registro eliminado con éxito', 'data' => 'OK', 'status' => '200'], 200);

                }catch (QueryException $e){
                    $Msg = new MessageAlertClass();
                    $Msg->Message($e);
                }
            } else {
                $valRet =  Response::json(['mensaje' => 'Se ha producido un error.', 'data' => 'Error', 'status' => '200'], 200);
            }
    //        }
            return $valRet;
        }

    */


}
