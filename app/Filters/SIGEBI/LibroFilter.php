<?php

namespace App\Filters\SIGEBI;

use App\Classes\GeneralFunctios;
use App\Filters\Common\QueryFilter;

class LibroFilter extends QueryFilter{


    public function rules(): array{
        return [
            'search'     => '',
            'searchbook' => '',
            'titulo'     => '',
            'autor'      => '',
            'id'         => '',
        ];
    }

    public function search($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$tsString]);

    }

    public function searchbook($query, $search){
        if (is_null($search) || empty ($search) || trim($search) == "") {return $query;}
        $F        = new GeneralFunctios();
        $tsString = $F->string_to_tsQuery( $search,' & ');

//        dd($tsString);

        $search = strtoupper(trim($search));
//        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString]);

        return $query->whereHas('InventarioLibro',function ($q) use ($tsString){
            return $q->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString]);
        })
            ->orWhereRaw("searchtext @@ to_tsquery('spanish', ?)", [$tsString]);




//        return $q->whereRaw("UPPER(isbn) like ?", "%{$search}%")
//            ->orWhereRaw("UPPER(codebar) like ?", "%{$search}%")
//            ->orWhereRaw("UPPER(clasificacion) like ?", "%{$search}%")
//            ->orWhereRaw("UPPER(edicion) like ?", "%{$search}%");

//        $items = self::table('libros AS l')
//            ->leftJoin('inventariolibros AS il', 'il.libro_id', '=', 'l.id')
//            ->whereRaw( "p.searchtext @@ to_tsquery('spanish', ?)", [$tsString] )
//            ->select('l.*, il.*')
//            ->orderByRaw("ts_rank(p.searchtext, to_tsquery('spanish', ?)) ASC", [$tsString])
//            ->orderByDesc('p.id')
//            ->get();
//        return $items;
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
