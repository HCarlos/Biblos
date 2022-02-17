<?php

namespace App\Models\SIGEBI;

use App\Filters\SIGEBI\InventarioLibroFilter;
use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InventarioLibro extends Model{

    use SoftDeletes;

    protected $guard_name = 'web';
    protected $table = 'inventariolibros';

    protected $fillable = [
        'id','libro_id', 'etiqueta_smarth', 'fecha_prestamo', 'fecha_entrega', 'fecha_apartado','uuid','observaciones',
        'isbn','codebar', 'prestado_user_id', 'apartado_user_id','status_libro', 'clasificacion','edicion','ficha_no',
        'no_coleccion', 'empresa_id','editorial_id', 'creado_por_id',
    ];

    public function scopeFilterByInventarioLibro($query, $filters){
        return (new InventarioLibroFilter())->applyTo($query, $filters);
    }


    public function Libro(){
        return $this->belongsTo(Libro::class);
    }

    public function Libros(){
//        return $this->hasMany(Libro::class);
        return $this->belongsToMany(Libro::class);
    }

    public function portadas(){
        return $this->belongsToMany(Portada::class,'inventariolibro_portada','inventariolibro_id','portada_id');
    }

    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }

    public function Editorial(){
        return $this->hasOne(Editoriale::class,'id','editorial_id');
//        return $this->belongsToMany(Editoriale::class);
    }

    public function getEstatusLibroAttribute(){
        //return intval($this->status_libro) == 1 ? 'DISPONIBLE' : 'NO DISPONIBLE';
        switch( intval($this->status_libro) ){
            case 1:
                return 'DISPONIBLE';
                break;
            case 2:
                return 'RESERVADO/APARTADO';
                break;
            case 3:
                return 'PRESTADO';
                break;
            default:
                return 'NO DISPONIBLE';
                break;
        }

    }


}
