<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class trabajadores extends Model
{
    public function trabajador(){
        return $this->hashOne("App/Model/trabajador");
    }
    Protected $fillable=["nombre", "apaterno", "amaterno", "direccion","telefono", "correo", "status"];
    use HasFactory;
}
