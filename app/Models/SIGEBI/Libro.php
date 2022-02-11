<?php

namespace App\Models\SIGEBI;

use App\Filters\SIGEBI\LibroFilter;
use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Libro extends Model{

    use SoftDeletes, Notifiable;
    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'libros';

    protected $fillable = [
        'id',
        'ficha_no', 'etiqueta_smarth', 'titulo', 'autor', 'datos_fijos', 'tipo_material_id', 'codebar',
        'observaciones', 'status_libro', 'empresa_id','editorial_id', 'creado_por_id',
    ];
    protected $casts = ['predeterminado'=>'boolean'];

    public function scopeSearch($query, $search){
        if (!$search || $search == "" || $search == null) return $query;
        return $query->whereRaw("searchtext @@ to_tsquery('spanish', ?)", [$search])
            ->orderByRaw("ts_rank(searchtext, to_tsquery('spanish', ?)) ASC", [$search]);
    }

    public function scopeFilterBySearch($query, $filters){
        return (new LibroFilter())->applyTo($query, $filters);
    }

    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }

    public function Editorial(){
        return $this->belongsToMany(Editoriale::class);
    }

    public function InventarioLibro(){
        return $this->hasMany(InventarioLibro::class,'libro_id','id');
//        return $this->belongsToMany(InventarioLibro::class,'libro_id','id');
    }

    public function TipoMaterial(){
        return $this->hasOne(TipoMaterial::class,'tipo_material_id');
    }

    public function portada(){
        return $this->hasOne(Portada::class,'id','libro_id');
    }

    public function portadas(){
        return $this->belongsToMany(Portada::class);
    }

}
