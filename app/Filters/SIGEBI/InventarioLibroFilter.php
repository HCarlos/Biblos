<?php

namespace App\Filters\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\Common\QueryFilter;

class InventarioLibroFilter extends QueryFilter
{


    public function rules(): array{
        return [
            'search'         => '',
            'libro_id'       => '',
            'isbn'           => '',
            'codebar'        => '',
            'clasificacion'  => '',
            'edicion'        => '',
            'fecha_prestamo' => '',
            'fecha_entrega'  => '',
            'fecha_apartado' => '',
        ];
    }

    public function search($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$tsString]);

    }

    public function libro_id($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        return $query->where("libro_id ", $search);
    }

    public function isbn($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("isbn like ?", "%{$search}%");
    }

    public function codebar($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("codebar like ?", "%{$search}%");
    }

    public function clasificacion($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("clasificacion like ?", "%{$search}%");
    }

    public function edicion($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $search = strtoupper(trim($search));
        return $query->whereRaw("edicion like ?", "%{$search}%");
    }

    public function fecha_prestamo($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        return $query->where("fecha_prestamo", $search);
    }

    public function fecha_entrega($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        return $query->where("fecha_entrega", $search);
    }

    public function fecha_apartado($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        return $query->where("fecha_apartado", $search);
    }


}
