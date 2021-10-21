
    <div class="form-group row">
        <x-inputs.text-field cols="2" tipo="text" nombre="isbn" nombrees="ISBN" valor="{{old('isbn',$item->isbn)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="2" tipo="text" nombre="codebar" nombrees="Código de Barras" valor="{{old('codebar',$item->codebar)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="clasificacion" nombrees="Clasificación" valor="{{old('clasificacion',$item->clasificacion)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="2" tipo="text" nombre="edicion" nombrees="Edición" valor="{{old('edicion',$item->edicion)}}"></x-inputs.text-field>
        <x-inputs.select-form cols="3" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="{{old('editorial_id',$item->editorial_id)}}"></x-inputs.select-form>
    </div>

<input type="hidden" name="id" id="id" value="{{$item->id}}">
<input type="hidden" name="libro_id" id="libro_id" value="{{ $Libro->id }}">
