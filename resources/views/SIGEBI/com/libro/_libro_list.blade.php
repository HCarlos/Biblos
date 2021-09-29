<x-catalogo-list>
    @slot('tituloTabla',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? '')
    @slot('IsModal', $IsModal ?? false )
    @slot('FullScreen',$FullScreen ?? false)
    @slot('Tabla')
        @include('SIGEBI.lay.libro.__libro_list')
    @endslot
</x-catalogo-list>
