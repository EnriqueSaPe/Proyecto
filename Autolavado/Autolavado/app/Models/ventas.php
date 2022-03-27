<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ventas extends Model
{
    public function venta(){
        return $this->hashOne("App/Model/venta");
    }
    Protected $fillable=["fecha", "id_vehiculo", "id_cajero", "id_servicio","id_trabajador", "status"];
    use HasFactory;
}
