<?php

namespace App\Http\Requests\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\Portada;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Foundation\Http\FormRequest;
use App\Classes\MessageAlertClass;
use Carbon\Carbon;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Database\QueryException;
use Symfony\Component\HttpFoundation\JsonResponse;

class PortadaRequest extends \Illuminate\Foundation\Http\FormRequest{



    protected $redirectRoute = '/portadaLibroNew';
    protected $disk = 'portada';
    protected $F;

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [];
    }


    public function managePortadaLibro()
    {
        $this->F = new GeneralFunctios();

        try {

            $fechaActual = Carbon::now()->format('Y-m-d h:m:s');
            $Item = [
                'fecha'         => $fechaActual,
                'creado_por_id' => $this->creado_por_id,
                'empresa_id'    => $this->empresa_id,
            ];
            //dd( $this->id );
            if ($this->id == "0") {
                $item = Portada::create($Item) ;
                $this->detaches($item);
                //$this->attaches($item);
                $this->saveFile($item);
            }

        }catch (QueryException $e){

            //dd ( $e->getMessage() );
            $Msg = new MessageAlertClass();
            return $Msg->Message($e);
        }
        return $item;

    }

    public function attaches($Item){

        $Item->libros()->attach($this->libro_id);
//        $lib = Libro::find($this->libro_id);
//        $lib->portadas()->attach($Item);
        return $Item;
    }

    public function detaches($Item){
        $Item->libros()->detach($this->libro_id);
//        $lib = Libro::find($this->libro_id);
//        $lib->portadas()->detach($this->id);

        return  $this->attaches($Item);
    }

    public function saveFile($Item){
        $file = $this->file('file');
        $ext = $file->extension();
        $name = sha1(date('YmdHis') . time()).'-'.$this->libro_id.'-'.$Item->id;
        $fileName = $name.'.' . $ext;
        $thumbnail = '_thumb_'.$name.'.png';
        $Item->update([
            'filename'         => $fileName,
            'filename_thumb'   => $thumbnail,
        ]);
        Storage::disk($this->disk)->put($fileName, File::get($file));
        // $img_thmb =
        $this->F->fitImage( $file,$thumbnail,128,128,true,$this->disk,"PORTADA_ROOT" );
        return true;
    }

    public function messages()
    {
//        return [
//            'file.required' => 'La IMAGEN es obligatoria.',
//        ];

        return [];

    }

    protected function getRedirectUrl()
    {
        $url = $this->redirector->getUrlGenerator();
        if ($this->id > 0){
            return $url->route($this->redirectRoute,['Id'=>$this->id]);
        }else{
            return $url->route('/portadaLibroNew',['Id'=>$this->denuncia__id]);
        }
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException($this->response(
            $this->formatErrors($validator)
        ));
    }
    protected function formatErrors(Validator $validator)
    {
        return $validator->errors()->getMessages();
    }

    public function response(array $errors)
    {
        if ($this->ajax() || $this->wantsJson()) {
            return new JsonResponse($errors, 422);
        }

        return $this->redirector->to($this->getRedirectUrl())
            ->withInput($this->except($this->dontFlash))
            ->withErrors($errors, $this->errorBag);

    }



}
