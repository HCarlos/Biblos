<?php

namespace App\View\Components\Inputs;

use Illuminate\View\Component;

class DateField extends Component{

    public $nombre;
    public $nombrees;
    public $sololectura;
    public $cols;
    public $class;
    public $valor;
    public $deshabilitado;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(string $nombre = null, string $nombrees = null, string $cols = null, string $class = null, string $valor = null, bool $sololectura = null){

        $this->nombre = $nombre ?? 'DateField_'.time();
        $this->nombrees = $nombrees ?? $this->nombre;
        $this->cols = $cols ?? 2;
        $this->class = $class ?? '';
        $this->valor = $valor ?? '';
        $this->deshabilitado = $deshabilitado ?? '';
        $this->sololectura   = $sololectura ?? '';

    }

    public function deshabilitado(){
        return $this->deshabilitado ? ' disabled ' : '';
    }

    public function sololectura(){
        return $this->sololectura ? ' readonly ' : '';
    }


    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.inputs.date-field');
    }

}
