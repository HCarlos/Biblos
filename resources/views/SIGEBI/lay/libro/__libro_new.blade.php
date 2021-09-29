<div class="form-group row">
    <x-inputs.text-field cols="3" tipo="text" nombre="ficha_no" nombrees="ficha" valor="{{old('ficha_no')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="3" tipo="text" nombre="isbn" nombrees="ISBN" valor="{{old('isbn')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="3" tipo="text" nombre="etiqueta smarth" valor="{{old('etiqueta_smarth')}}"></x-inputs.text-field>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="8" tipo="text" nombre="titulo" valor="{{old('titulo')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="4" tipo="text" nombre="autor" nombrees="autor" valor="{{old('autor')}}"></x-inputs.text-field>
    <div class="col-sm-4"></div>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="3" tipo="text" nombre="clasificacion" nombrees="clasificacion" valor="{{old('clasificacion')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="3" tipo="text" nombre="no_coleccion" nombrees="no_coleccion" valor="{{old('no_coleccion')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="3" tipo="text" nombre="codebar" valor="{{old('codebar')}}"></x-inputs.text-field>
</div>
<div class="form-group row">
    <x-inputs.select-form cols="6" nombre="tipo_material_id" nombrees="tipo de material" :arr="$TipoMaterial" valor="-1"></x-inputs.select-form>
    <x-inputs.select-form cols="6" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="-1"></x-inputs.select-form>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="12" tipo="text" nombre="observaciones" nombrees="observaciones" valor="{{old('observaciones')}}"></x-inputs.text-field>
</div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
