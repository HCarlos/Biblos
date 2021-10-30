<div class="navbar-content flex-grow-0 ml-auto">
@if( ! is_null($newItem) && isset($newItem) )
    <a href="{{ route($newItem) }}" class="btn btn-sm px-2 btn-outline-grey btn-h-outline-green btn-h-text-grey btn-a-outline-green btn-bold btn-brc-tp mx-lg-2 @if( $IsModal ) btnFullModal @endif " title="Nuevo" >
        <i class="fa fa-plus bgc-green radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
        <span class="d-none d-lg-inline">Nuev@</span>
    </a>
@endif

@if( ! is_null($newItemWithData) && isset($newItemWithData) )
    <a href="{{ route($newItemWithData,['Id'=>$Id]) }}" class="btn btn-sm px-2 btn-outline-grey btn-h-outline-green btn-h-text-grey btn-a-outline-green btn-bold btn-brc-tp mx-lg-2 @if( $IsModal ) btnFullModal @endif " title="Nuevo" >
        <i class="fa fa-plus bgc-green radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
        <span class="d-none d-lg-inline">Nuev@</span>
    </a>
@endif
@if( ! is_null($searchButton))
    <a href="{{ route($searchButton) }}" class="btn btn-sm px-2 btn-outline-grey btn-h-outline-orange btn-h-text-grey btn-a-outline-orange btn-bold btn-brc-tp mx-lg-2 btnFullModal"  title="Consultar" data-toggle="modal" data-target="#modalFull">
        <i class="fa fa-binoculars bgc-orange radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
        <span class="d-none d-lg-inline">Filtrar</span>
    </a>
@endif
@if( ! is_null($excelButton))
    <a href="{{ route($excelButton) }}" class="btn btn-sm px-2 btn-outline-grey btn-h-outline-info btn-h-text-grey btn-a-outline-info btn-bold btn-brc-tp mx-lg-2 " title="Exportar a MS Excel">
        <i class="fa fa-file-excel bgc-info radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
        <span class="d-none d-lg-inline">Exportar</span>
    </a>
@endif
@include('share.bars.___paginator')
</div>
