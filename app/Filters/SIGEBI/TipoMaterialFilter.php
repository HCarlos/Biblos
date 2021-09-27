<?php

namespace App\Filters\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\Common\QueryFilter;
use Illuminate\Support\Carbon;

class TipoMaterialFilter extends QueryFilter{

    public function rules(): array{
        return [
            'search'           => '',
            'tipo_material'    => '',
        ];
    }

    public function search($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$tsString]);

    }

    public function tipo_material($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("tipo_material like ?", "%{$search}%");
    }

}
