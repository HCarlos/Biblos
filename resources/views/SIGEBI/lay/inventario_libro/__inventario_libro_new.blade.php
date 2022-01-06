
    <div class="form-group row">
        <x-inputs.text-field cols="3" tipo="text" nombre="ficha_no" nombrees="No Ficha" valor="{{old('ficha_no')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="isbn" nombrees="ISBN" valor="{{old('isbn')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="codebar" nombrees="Código de Barras" valor="{{old('codebar')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="clasificacion" nombrees="Clasificación" valor="{{old('clasificacion')}}"></x-inputs.text-field>
    </div>
    <div class="form-group row">
        <x-inputs.text-field cols="3" tipo="text" nombre="edicion" nombrees="Edición" valor="{{old('edicion')}}"></x-inputs.text-field>
        <x-inputs.select-form cols="3" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="{{old('editorial_id',$Libro->editorial_id)}}"></x-inputs.select-form>
        <x-inputs.text-field cols="6" tipo="text" nombre="no coleccion" nombrees="Núm Colección" valor="{{old('no_coleccion')}}"></x-inputs.text-field>
    </div>
    <div class="form-group row">
        <x-inputs.text-field cols="12" tipo="text" nombre="etiqueta smarth" nombrees="Etiqueta Smarth" valor="{{old('etiqueta_smarth')}}"></x-inputs.text-field>
    </div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="libro_id" id="libro_id" value="{{ $Libro->id }}">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
