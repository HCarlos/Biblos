<?php

namespace App\Http\Requests\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Models\SIGEBI\TipoMaterial;
use App\Models\User;
use App\Models\User\Permission;
use App\Models\User\Role;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class TipoMaterialRequest extends FormRequest{


    protected $redirectRoute = 'editTipoMaterial';

    public function authorize(){
        return true;
    }

    public function rules(){
        return [
            'tipo_material' => ['required','min:4','unique:tipomaterial,tipo_material,'.$this->id],
        ];
    }

    public function messages(){
        return [
            'tipo_material.required' => 'El :attribute requiere por lo menos de 4 caracter',
            'tipo_material.unique' => 'El :attribute ya existe.',
        ];
    }

    public function attributes(){
        return [
            'tipo_material' => 'Tipo de Material',
        ];
    }

    public function manage()
    {

        try {


            $Obj0 = [
                'tipo_material' => strtoupper(trim($this->tipo_material)),
            ];

            if ($this->id == 0) {

                $Item = TipoMaterial::create($Obj0);

            } else {

                $Item = TipoMaterial::find($this->id);
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
            return $url->route("newTipoMaterial");
        }
    }


}
