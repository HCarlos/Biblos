
    <div class="form-group row">
        <x-inputs.text-field cols="3" tipo="text" nombre="ficha_no" nombrees="No Ficha" valor="{{old('ficha_no',$item->ficha_no)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="isbn" nombrees="ISBN" valor="{{old('isbn',$item->isbn)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="codebar" nombrees="Código de Barras" valor="{{old('codebar',$item->codebar)}}"></x-inputs.text-field>
        <x-inputs.text-field cols="3" tipo="text" nombre="clasificacion" nombrees="Clasificación" valor="{{old('clasificacion',$item->clasificacion)}}"></x-inputs.text-field>
    </div>
    <div class="form-group row">
        <x-inputs.text-field cols="3" tipo="text" nombre="edicion" nombrees="Edición" valor="{{old('edicion',$item->edicion)}}"></x-inputs.text-field>
        <x-inputs.select-form cols="3" nombre="editorial_id" nombrees="Editorial" :arr="$Editoriales" valor="{{old('editorial_id',$item->editorial_id)}}"></x-inputs.select-form>
        <x-inputs.text-field cols="6" tipo="text" nombre="no_coleccion" nombrees="Núm Colección" valor="{{old('no_coleccion',$item->no_coleccion)}}"></x-inputs.text-field>
    </div>
    <div class="form-group row">
        <x-inputs.text-field cols="12" tipo="text" nombre="etiqueta smarth" nombrees="Etiqueta Smarth" valor="{{old('etiqueta_smarth',$item->etiqueta_smarth)}}"></x-inputs.text-field>
    </div>

<input type="hidden" name="id" id="id" value="{{$item->id}}">
<input type="hidden" name="libro_id" id="libro_id" value="{{ $Libro->id }}">
