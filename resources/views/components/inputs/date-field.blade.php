@php $Nombre = str_replace(' ','_',strtolower($nombre)) @endphp
<div class="col-sm-{{$cols}}">
    <label class="col-form-label" for="{{ $Nombre }}">{{ $nombrees }}</label>
    <input type="date" class="form-control {{ $Nombre }} {{$class ? $class : ''}} has-error form-error " placeholder="{{ ucwords($nombre) }}" name="{{ $Nombre }}" id="{{ $Nombre }}" value="{{ \Carbon\Carbon::createFromDate($valor)->format('Y-m-d') }}" {{$deshabilitado}} {{$sololectura}} >
    @include('share.bars.___help_input')
    @include('share.bars.___error_input')
</div>
