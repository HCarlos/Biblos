
<table class="table text-dark-m2 text-95 bgc-white ml-n1px m-2" id="table">
    <thead class="text-dark-tp3 bgc-grey-l4 text-90 border-b-1 brc-transparent">
    <tr>
        <th>ID</th>
        <th>EDITORIAL</th>
        <th>REPRESENTANTE</th>
        <th>TELÉFONOS</th>
        <th>EMAILS</th>
        <th>PREDETERMINADO</th>
        <th></th>
    </tr>
    </thead>

    <tbody class="mt-1">
    @foreach($items as $item)
        <tr class="bgc-h-yellow-l4 d-style">

            <td class='text-blue-d1 text-600 text-95'>
                {{$item->id}}
            </td>
            <td class="text-600 ">
                {{$item->editorial}}
            </td>
            <td class="text-600 ">
                {{$item->representante}}
            </td>
            <td class="text-600 ">
                {{$item->telefonoes}}
            </td>
            <td class="text-600 ">
                {{$item->email}}
            </td>
            <td class="text-600 text-center ">
                @if($item->predeterminado) <i class="fa fa-check text-120 mt-3px text-success"></i> @endif
            </td>
            <td>
                <!-- action buttons -->
                <div class='d-none d-lg-flex'>
                    @include('share.bars.___editItem')
                    @include('share.bars.___removeItem')
                </div>

                <!-- show a dropdown in mobile -->
                <div class='dropdown d-inline-block d-lg-none dd-backdrop dd-backdrop-none-lg'>
                    <a href='#' class='btn btn-default btn-xs py-15 radius-round dropdown-toggle' data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </a>

                    <div class="dropdown-menu dd-slide-up dd-slide-none-lg">
                        <div class="dropdown-inner">
                            @include('share.bars.___editItem')
                            @include('share.bars.___removeItem')
                        </div>
                    </div>
                </div>

            </td>
        </tr>
    @endforeach
    </tbody>
</table>
