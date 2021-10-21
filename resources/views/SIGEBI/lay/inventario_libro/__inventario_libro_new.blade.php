
    <div class="form-group row">
        <x-inputs.text-field cols="2" tipo="text" nombre="isbn" nombrees="ISBN" valor="{{old('isbn')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="2" tipo="text" nombre="codebar" nombrees="Código de Barras" valor="{{old('codebar')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="clasificacion" nombrees="Clasificación" valor="{{old('clasificacion')}}"></x-inputs.text-field>
        <x-inputs.text-field cols="2" tipo="text" nombre="edicion" nombrees="Edición" valor="{{old('edicion')}}"></x-inputs.text-field>
        <x-inputs.select-form cols="3" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="{{old('editorial_id',$Libro->editorial_id)}}"></x-inputs.select-form>
    </div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="libro_id" id="libro_id" value="{{ $Libro->id }}">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
