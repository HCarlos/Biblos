<?php

namespace App\Filters\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\Common\QueryFilter;

class EditorialFilter extends QueryFilter{


    public function rules(): array{
        return [
            'search'        => '',
            'editorial'     => '',
            'representante' => '',
            'telefonos'     => '',
            'email'         => '',
        ];
    }

    public function search($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$tsString]);

    }

    public function editorial($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("editorial like ?", "%{$search}%");
    }

    public function representante($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("representante like ?", "%{$search}%");
    }

    public function telefonos($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("telefonos like ?", "%{$search}%");
    }

    public function email($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("email like ?", "%{$search}%");
    }

}
