<div class="form-group row">
    <x-inputs.text-field cols="8" tipo="text" nombre="titulo" nombrees="Título" valor="{{old('titulo')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="4" tipo="text" nombre="autor" nombrees="autor" valor="{{old('autor')}}"></x-inputs.text-field>
    <div class="col-sm-4"></div>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="1" tipo="text" nombre="ficha_no" nombrees="ficha" valor="{{old('ficha_no')}}"></x-inputs.text-field>
    <x-inputs.select-form cols="7" nombre="tipo_material_id" nombrees="tipo de material" :arr="$TipoMaterial" valor="{{old('tipo_material_id')}}"></x-inputs.select-form>
    <x-inputs.select-form cols="4" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="{{old('editorial_id')}}"></x-inputs.select-form>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="12" tipo="text" nombre="observaciones" nombrees="observaciones" valor="{{old('observaciones')}}"></x-inputs.text-field>
</div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
