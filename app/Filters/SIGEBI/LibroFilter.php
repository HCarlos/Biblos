<?php

namespace App\Filters\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\Common\QueryFilter;

class LibroFilter extends QueryFilter{


    public function rules(): array{
        return [
            'search' => '',
            'titulo' => '',
            'autor'  => '',
            'id'     => '',
        ];
    }

    public function search($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$tsString]);

    }

    public function titulo($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("titulo like ?", "%{$search}%");
    }

    public function autor($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("autor like ?", "%{$search}%");
    }

    public function id($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->where("id", $search);
    }


}
