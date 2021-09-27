<?php

namespace App\Models\SIGEBI;

use App\Filters\SIGEBI\TipoMaterialFilter;
use App\Filters\User\UserFilter;
use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class TipoMaterial extends Model{


    use SoftDeletes, Notifiable;
    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'tipomaterial';

    protected $fillable = [
        'id',
        'tipo_material',
        'empresa_id', 'creado_por_id',
    ];

    public function scopeFilterBySearch($query, $filters){
        return (new TipoMaterialFilter())->applyTo($query, $filters);
    }


    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }

}
