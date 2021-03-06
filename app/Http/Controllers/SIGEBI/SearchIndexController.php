<?php

namespace App\Http\Controllers\SIGEBI;

use App\Filters\SIGEBI\LibroFilterRules;
use App\Http\Controllers\Controller;
use App\Models\SIGEBI\InventarioLibro;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SearchIndexController extends Controller{

    public function __construct(){
        $this->middleware('auth');
    }

    public function listadoAprtados(Request $request){

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

        $items = InventarioLibro::query()
            ->where('status_libro','=',2)
            ->filterByInventarioLibro($filters)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();

        $request->session()->put('items', $items);

        return view('SIGEBI.com.inventario_libro.apartados._apartado_list',[
            'items'                     => $items,
            'user'                      => $user,
            'editItem'                  => null,
            'removeItem'                => null,
            'IsModal'                   => true,
            'prestarLibro'              => 'showModalPrestar',
            'showRestablecerDisponible' => 'showRestablecerDisponible',
        ]);


    }

    public function buscarLibroApartado(){

        return view('layouts.partials.SIGEBI.home_search');

    }

    public function listadoPrestados(Request $request){

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

        $items = InventarioLibro::query()
            ->where('status_libro','=',3)
            ->filterByInventarioLibro($filters)
            ->orderByDesc('id')
            ->paginate(250);
        $items->appends($filters)->fragment('table');

        $user = Auth::user();

        $request->session()->put('items', $items);

        return view('SIGEBI.com.inventario_libro.prestamos._prestados_list',[
            'items'                     => $items,
            'user'                      => $user,
            'editItem'                  => null,
            'removeItem'                => null,
            'IsModal'                   => true,
            'entregarLibro'             => 'showModalEntregar',
            'showRestablecerDisponible' => 'showRestablecerDisponible',
        ]);


    }


}
