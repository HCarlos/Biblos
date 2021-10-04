@php $Nombre = str_replace(' ','_',strtolower($nombre)) @endphp
@if(is_null($cols1))
    <div class="col-sm-{{$cols}}">
        <label class="col-form-label" for="{{ $Nombre }}">{{ ucwords($nombrees) }}</label>
        <input type="{{$tipo}}" class="form-control {{ $Nombre }} {{$class ? $class : ''}} has-error form-error " placeholder="{{ ucwords($nombrees) }}" name="{{ $Nombre }}" id="{{ $Nombre }}" value="{{$valor}}" {{$deshabilitado}} {{$sololectura}} >
        @include('share.bars.___help_input')
        @include('share.bars.___error_input')
    </div>
@else
    <div class="col-sm-{{$cols}} {{$class}} " >
        <label for="{{ $nombre }}" >
            {{ strtoupper($nombrees) }}
        </label>
    </div>
    <div class="col-sm-{{$cols1}} {{$class1}}  ">
        <input type="{{$tipo}}" class="form-control {{ $Nombre }} col-sm-{{$cols1}} {{$class1}} has-error form-error " placeholder="{{ ucwords($nombre_es) }}" name="{{ $Nombre }}" id="{{ $Nombre }}" value="{{$valor}}" {{$deshabilitado}} {{$sololectura}} >
        @include('share.bars.___error_input')
        @include('share.bars.___error_input')
    </div>
@endif
