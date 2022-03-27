<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cajeros extends Model
{
    public function Cajero(){
        return $this->hashOne("App/Model/cajero");
    }
    Protected $fillable=["nombre", "apaterno", "amaterno", "direccion","telefono", "correo", "status"];
    use HasFactory;
}
