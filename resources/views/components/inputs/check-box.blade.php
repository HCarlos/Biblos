@php $Nombre = str_replace(' ','_',strtolower($nombre)) @endphp
<div class="col-sm-{{$cols}} has-error mb-1">
    <label class="col-form-label" for="{{ $Nombre }}">{{ ucwords($nombrees) }}</label>
    <br>
    <input type="{{$tipo}}" id="{{ $Nombre }}" name="{{ $Nombre }}" @if ($valor) checked @endif class="ace-switch input-lg ace-switch-bars-h ace-switch-check ace-switch-times text-grey-l2 bgc-orange-d2 radius-2px has-error form-error ">
    @include('share.bars.___error_input')
</div>
