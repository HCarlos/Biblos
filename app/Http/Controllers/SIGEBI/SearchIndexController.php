<?php

namespace App\Http\Controllers\SIGEBI;

use App\Http\Controllers\Controller;

class SearchIndexController extends Controller{

    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){

//        $this->lim_max_reg = config('ibt.limite_maximo_registros');
//        $this->lim_min_reg = config('ibt.limite_minimo_registros');
//        $this->max_reg_con = config('ibt.maximo_registros_consulta');
//        $this->min_reg_con = config('ibt.minimo_registros_consulta');
//
//        $this->Request = $request;
//
//        @ini_set( 'upload_max_size' , '16384M' );
//        @ini_set( 'post_max_size', '16384M');
//        @ini_set( 'max_execution_time', '960000' );

//        $filters = new UserFilterRules();
//        $filters = $filters->filterRulesUserDB($request);
//
//        $items = Libro::query()
//            ->filterBySearch($filters)
//            ->orderByDesc('id')
//            ->paginate(250);
//        $items->appends($filters)->fragment('table');
//
        //$user = Auth::user();



//        $request->session()->put('items', $items);

       return view('layouts.partials.SIGEBI.home_search');

    }


}
