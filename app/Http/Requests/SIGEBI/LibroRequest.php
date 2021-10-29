<?php

namespace App\Http\Requests\SIGEBI;

use App\Models\SIGEBI\Libro;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Log;

class LibroRequest extends FormRequest{


    protected $redirectRoute = 'newLibro';

    public function authorize(){
        return true;
    }

    public function validationData(){
        $attributes = parent::all();
        $attributes['titulo'] = strtoupper(trim($attributes['titulo']));
        $attributes['autor'] = strtoupper(trim($attributes['autor']));
        $this->replace($attributes);
        return parent::all();
    }

    public function rules(){
        return [
            'titulo'           => ['required','min:4'],
            'tipo_material_id' => ['min:1'],
            'editorial_id'     => ['min:1'],
        ];
    }

    public function messages(){
        return [
            'titulo.required'      => 'El :attribute requiere por lo menos de 4 caracter',
            'titulo.min'           => 'El :attribute requiere por lo menos de 4 caracter',

            'tipo_material_id.min' => 'Debe seleccionar un :attribute',
            'editorial_id.min'     => 'Debe seleccionar un :attribute',
        ];
    }

    public function attributes(){
        return [
            'titulo'           => 'Titulo',
            'tipo_material_id' => 'Tipo de Material',
            'editorial_id'     => 'Editorial',
        ];
    }

    public function manage()
    {


        try {

            //dd($this->all());


            $Obj0 = [
                'ficha_no'         => strtoupper(trim($this->ficha_no)),
                'titulo'           => strtoupper(trim($this->titulo)),
                'autor'            => strtoupper(trim($this->autor)),

                'tipo_material_id' => strtoupper(trim($this->tipo_material_id)),
                'editorial_id'     => strtoupper(trim($this->editorial_id)),

                'empresa_id'       => strtoupper(trim($this->empresa_id)),
                'creado_por_id'    => strtoupper(trim($this->creado_por_id)),

                'observaciones'    => strtoupper(trim($this->observaciones)),
            ];
            //dd($Obj0);
            if ($this->id == 0) {
                $Item = Libro::create($Obj0);

            } else {
                $Item = Libro::find($this->id);
                $Item->update($Obj0);

            }
        }catch (QueryException $e){
            Log::alert("Ver Error => ".$e->getMessage());
            return $e->getMessage();
        }
        return $Item;
    }

    protected function getRedirectUrl(){
        $url = $this->redirector->getUrlGenerator();
        if ($this->id > 0){
            return $url->route($this->redirectRoute,['Id'=>$this->id]);
        }else{
            return $url->route("newLibro");
        }
    }

}
