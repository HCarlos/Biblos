{{--<x-inline.catalogo-inline-list>--}}
{{--    @slot('tituloTabla',$tituloTabla)--}}
{{--    @slot('items',$items)--}}
{{--    @slot('user',$user)--}}
{{--    @slot('newItem',$newItem ?? null)--}}
{{--    @slot('searchButton', $searchButton ?? null)--}}
{{--    @slot('excelButton', $excelButton ?? null)--}}
{{--    @slot('editItem',$editItem)--}}
{{--    @slot('removeItem',$removeItem)--}}
{{--    @slot('listItems',$listItems ?? null)--}}
{{--    @slot('IsModal', $IsModal ?? false )--}}
{{--    @slot('FormInline',$FormInline ?? 'none')--}}
{{--    @slot('Id',$Id ?? 1)--}}
{{--    @slot('Tabla')--}}
{{--        @include('SIGEBI.lay.inventario_libro.__inventario_libro_list')--}}
{{--    @endslot--}}
{{--</x-inline.catalogo-inline-list>--}}

<x-empty-canva>
    @slot('tituloTabla',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? null)
    @slot('IsModal', $IsModal ?? false )
    @slot('FormInline',$FormInline ?? 'none')
    @slot('Id',$Id ?? 1)
    @slot('Content')
        @include('SIGEBI.lay.inventario_libro.__inventario_libro_list')
    @endslot
</x-empty-canva>
