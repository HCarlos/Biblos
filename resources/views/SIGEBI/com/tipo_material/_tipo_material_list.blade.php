<x-catalogo-list>
    @slot('titulo',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? '')
    @slot('IsModal', $IsModal ?? false )
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('Tabla')
        @include('SIGEBI.lay.tipo_material.__tipo_material_list')
    @endslot
</x-catalogo-list>
