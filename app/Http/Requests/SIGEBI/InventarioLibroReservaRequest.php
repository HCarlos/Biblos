<?php

namespace App\Http\Requests\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Classes\MessageAlertClass;
use App\Models\SIGEBI\HistorialLibro;
use App\Models\SIGEBI\InventarioLibro;
use App\Models\SIGEBI\Libro;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Str;

class InventarioLibroReservaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [];
    }

    public function manageApartados()
    {

        try {
            $Obs = $this->observaciones == null ? '' : strtoupper(trim($this->observaciones));
            $Item = [
                "fecha_apartado" => $this->fecha_apartado,
                "fecha_prestamo" => null,
                "fecha_entrega" => $this->fecha_entrega,
                "observaciones" => $Obs,
                "apartado_user_id" => $this->apartado_user_id,
                "status_libro" => 2,
                "creado_por_id" => intval($this->creado_por_id),
                "empresa_id" => intval($this->empresa_id),
            ];

            $IL = InventarioLibro::find($this->id);
            $IL->update($Item);

            $Libro = Libro::find($this->libro_id);

            $hl = [
                'libro_id' => $Libro->id,
                'inventariolibro_id' => $IL->id,
                'user_id' => $IL->apartado_user_id,
                'fecha' => $IL->fecha_apartado,
                'tipo_movto' => "RESERVADO/APARTADO",
                'observaciones' => $Obs,
                'empresa_id' => $IL->empresa_id,
                'creado_por_id' => $IL->creado_por_id,
            ];

            // dd($hl);

            $Hl = HistorialLibro::create($hl);

            //dd($Hl);

        } catch (QueryException $e) {
            //dd ( $e->getMessage() );
            $Msg = new MessageAlertClass();
            return $Msg->Message($e);
        }
        return $IL;

    }


    public function managePrestamos()
    {

        try {
            $Obs = $this->observaciones == null ? '' : strtoupper(trim($this->observaciones));
            $Item = [
                "fecha_prestamo" => $this->fecha_prestamo,
                "fecha_entrega" => $this->fecha_entrega,
                "observaciones" => $Obs,
                "prestado_user_id" => $this->prestado_user_id,
                "status_libro" => 3,
                "creado_por_id" => intval($this->prestado_user_id),
            ];

            //dd($Item);

            $IL = InventarioLibro::find($this->id);
            $IL->update($Item);

            $Libro = Libro::find($this->libro_id);

            $hl = [
                'libro_id' => $Libro->id,
                'inventariolibro_id' => $IL->id,
                'user_id' => $this->prestado_user_id,
                'fecha' => $this->fecha_prestamo,
                'tipo_movto' => "PRESTADO",
                'observaciones' => $Obs,
                'creado_por_id' => $this->creado_por_id,
            ];
            $Hl = HistorialLibro::create($hl);

        } catch (QueryException $e) {
            //dd ( $e->getMessage() );
            $Msg = new MessageAlertClass();
            return $Msg->Message($e);
        }
        return $IL;

    }





    public function manageEntregas(){

        try {
            $Obs =  $this->observaciones == null ? '' : strtoupper(trim($this->observaciones));
            $Item = [
                "fecha_entrega"     => $this->fecha_entrega,
                "observaciones"     => $Obs,
                "status_libro"      => 1,
                "creado_por_id"     => intval($this->prestado_user_id),
            ];

//            dd($Item);

            $IL = InventarioLibro::find($this->id);
            $IL->update($Item);

            $Libro = Libro::find($this->libro_id);

            $hl = [
                'libro_id'           => $Libro->id,
                'inventariolibro_id' => $IL->id,
                'user_id'            => $this->prestado_user_id,
                'fecha'              => $this->fecha_entrega,
                'tipo_movto'         => "ENTREGADO",
                'observaciones'      => $Obs,
                'creado_por_id'      => $this->creado_por_id,
            ];
            $Hl = HistorialLibro::create($hl);

        }catch (QueryException $e){
            //dd ( $e->getMessage() );
            $Msg = new MessageAlertClass();
            return $Msg->Message($e);
        }
        return $IL;

    }







}
