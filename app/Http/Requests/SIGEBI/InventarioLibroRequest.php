<?php

namespace App\Http\Requests\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Classes\MessageAlertClass;
use App\Models\SIGEBI\InventarioLibro;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\Portada;
use Carbon\Carbon;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\JsonResponse;

class InventarioLibroRequest extends FormRequest{

    protected $redirectRoute = '/inventarioLibroNew';
    protected $F;

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [];
    }

    public function manageInventarioLibro()
    {
        $this->F = new GeneralFunctios();

        try {

            if ($this->id == "0") {
                $Item = [
                    'isbn'            => $this->isbn,
                    'ficha_no'        => $this->ficha_no,
                    'codebar'         => $this->codebar,
                    'clasificacion'   => $this->clasificacion,
                    'edicion'         => $this->edicion,
                    'editorial_id'    => $this->editorial_id,
                    'libro_id'        => $this->libro_id,
                    'no_coleccion'    => strtoupper(trim($this->no_coleccion)),
                    'etiqueta_smarth' => strtoupper(trim($this->etiqueta_smarth)),
                    'creado_por_id'   => $this->creado_por_id,
                    'empresa_id'      => $this->empresa_id,
                    'uuid'            => Str::uuid()->toString(),
                ];
                $Lib = Libro::find($this->libro_id);
                $item = InventarioLibro::create($Item) ;
                $portada_id = $Lib->portadas->last()->id ?? 0;
                if ($portada_id > 0)
                    $item->portadas()->attach( $portada_id );

            }else{
                $Item = [
                    'isbn'            => $this->isbn,
                    'ficha_no'        => $this->ficha_no,
                    'codebar'         => $this->codebar,
                    'clasificacion'   => $this->clasificacion,
                    'edicion'         => $this->edicion,
                    'editorial_id'    => $this->editorial_id,
                    'libro_id'        => $this->libro_id,
                    'no_coleccion'    => strtoupper(trim($this->no_coleccion)),
                    'etiqueta_smarth' => strtoupper(trim($this->etiqueta_smarth)),
                ];
                $item = InventarioLibro::find($this->id);
                $item->update($Item);

            }

        }catch (QueryException $e){
            //dd ( $e->getMessage() );
            $Msg = new MessageAlertClass();
            return $Msg->Message($e);
        }
        return $item;

    }

    protected function getRedirectUrl()
    {
        $url = $this->redirector->getUrlGenerator();
        if ($this->id > 0){
            return $url->route($this->redirectRoute,['Id'=>$this->id]);
        }else{
            return $url->route('/inventarioLibroNew',['Id'=>$this->id]);
        }
    }


}
