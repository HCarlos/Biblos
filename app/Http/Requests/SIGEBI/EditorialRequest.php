<?php

namespace App\Http\Requests\SIGEBI;

use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\TipoMaterial;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;

class EditorialRequest extends FormRequest{


    protected $redirectRoute = 'editEditorial';

    public function authorize(){
        return true;
    }

    public function rules(){
        return [
            'editorial' => ['required','min:4'],
        ];
    }

    public function messages(){
        return [
            'editorial.required' => 'El :attribute requiere por lo menos de 4 caracter',
        ];
    }

    public function attributes(){
        return [
            'editorial' => 'Editorial',
        ];
    }

    public function manageUser()
    {

        try {

            //dd($this->all());

            $Obj0 = [
                'editorial'        => strtoupper(trim($this->editorial)),
                'representante'    => strtoupper(trim($this->representante)),
                'telefonos'        => strtoupper(trim($this->telefonos)),
                'email'            => strtoupper(trim($this->email)),
                'status_editorial' => $this->status_editorial ? 1 : 0,
                'predeterminado'   => $this->predeterminado ? true : false,
                'empresa_id'       => strtoupper(trim($this->empresa_id)),
                'creado_por_id'    => strtoupper(trim($this->creado_por_id)),
            ];

            //dd($Obj0);

            if ($this->id == 0) {
                if ( $Obj0['predeterminado'] == true ){
                    Editoriale::where('predeterminado',true)->update(['predeterminado'=>false]);
                }
                $Item = Editoriale::create($Obj0);

            } else {

                if ( $Obj0['predeterminado'] == true ){
                   Editoriale::where('predeterminado',true)->update(['predeterminado'=>false]);
                }

                $Item = Editoriale::find($this->id);
                $Item->update($Obj0);

            }
        }catch (QueryException $e){
            return $e->getMessage();
        }
        return $Item;
    }

    protected function getRedirectUrl()
    {
        $url = $this->redirector->getUrlGenerator();
        if ($this->id > 0){
            return $url->route($this->redirectRoute,['Id'=>$this->id]);
        }else{
            return $url->route("newEditorial");
        }
    }



}
