<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class servicios extends Model
{
    public function servicio(){
        return $this->hashOne("App/Model/servicio");
    }
    Protected $fillable=[
        "descripcion", 
        "costo", 
        "status",
        "fechaReg"];
    use HasFactory;
}
