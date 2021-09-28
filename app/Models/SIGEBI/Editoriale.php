<?php

namespace App\Models\SIGEBI;

use App\Filters\SIGEBI\EditorialFilter;
use App\Filters\SIGEBI\TipoMaterialFilter;
use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Editoriale extends Model{


    use SoftDeletes, Notifiable;
    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'editoriales';

    protected $fillable = [
        'id',
        'editorial', 'representante','telefonos','email','status_editorial','predeterminado',
        'empresa_id','migration_id', 'creado_por_id',
    ];

    protected $casts = ['predeterminado'=>'boolean'];

    public function scopeFilterBySearch($query, $filters){
        return (new EditorialFilter())->applyTo($query, $filters);
    }


    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }


}
