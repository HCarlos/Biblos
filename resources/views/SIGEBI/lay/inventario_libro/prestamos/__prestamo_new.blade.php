<div class="form-group row">
    <x-inputs.date-field cols="12" nombre="fecha_apartado" nombrees="Fecha de Apartado" valor="{{ old('fecha_apartado',$item->fecha_apartado) }}" sololectura="true"></x-inputs.date-field>
    <x-inputs.date-field cols="12" nombre="fecha_apartado_vencimiento" nombrees="Vencimiento Apartado" valor="{{ old('fecha_apartado',$item->fecha_apartado_vencimiento) }}" sololectura="true"></x-inputs.date-field>
    <x-inputs.date-field cols="12" nombre="fecha_prestamo" nombrees="Fecha de Prestamo" valor="{{ \Carbon\Carbon::now() }}" ></x-inputs.date-field>
    <x-inputs.date-field cols="12" nombre="fecha_entrega" nombrees="Fecha de Devolución" valor="{{ \Carbon\Carbon::now()->addDay(3) }}"></x-inputs.date-field>
    <div class="col-sm-12">
        <label class="col-form-label" for="observaciones">Observaciones</label>
        <textarea id="observaciones" name="observaciones" rows="2" class="form-control"> </textarea>
    </div>
</div>
<input type="hidden" name="id" id="id" value="{{$item->id}}">
<input type="hidden" name="libro_id" id="libro_id" value="{{$item->libro_id}}">
<input type="hidden" name="prestado_user_id" id="prestado_user_id" value="{{$item->apartado_user_id}}">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{$User->id}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">


