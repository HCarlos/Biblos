<?php

namespace App\Http\Requests\SIGEBI;

use App\Models\SIGEBI\Libro;
use App\Models\SIGEBI\Libroe;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;

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
            'titulo' => ['required','min:4','unique:libros,titulo,'.$this->id],
        ];
    }

    public function messages(){
        return [
            'titulo.required' => 'El :attribute requiere por lo menos de 4 caracter',
            'titulo.min' => 'El :attribute requiere por lo menos de 4 caracter',
            'titulo.unique'   => 'El :attribute ya existe.',
        ];
    }

    public function attributes(){
        return [
            'titulo' => 'Titulo',
        ];
    }

    public function manage()
    {


        try {

            //dd($this->all());


            $Obj0 = [
                'ficha_no'         => strtoupper(trim($this->ficha_no)),
                'isbn'             => strtoupper(trim($this->isbn)),
                'etiqueta_smarth'  => strtoupper(trim($this->etiqueta_smarth)),
                'titulo'           => strtoupper(trim($this->titulo)),
                'autor'            => strtoupper(trim($this->autor)),
                'clasificacion'    => strtoupper(trim($this->clasificacion)),
                'no_coleccion'     => strtoupper(trim($this->no_coleccion)),
                'codebar'          => strtoupper(trim($this->codebar)),

                'tipo_material_id' => strtoupper(trim($this->tipo_material_id)),
                'editorial_id'     => strtoupper(trim($this->editorial_id)),

                'empresa_id'       => strtoupper(trim($this->empresa_id)),
                'creado_por_id'    => strtoupper(trim($this->creado_por_id)),

                'observaciones'    => strtoupper(trim($this->observaciones)),
            ];

            if ($this->id == 0) {
                $Item = Libro::create($Obj0);

            } else {

                $Item = Libro::find($this->id);
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
            return $url->route("newLibro");
        }
    }



}
