<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehiculos', function (Blueprint $table) {
            $table->increments('id_vehiculo');
            $table->string('matricula', 50);
            $table->string('tipo', 50);
            $table->string('marca', 15);
            $table->integer('modelo');            
            $table->string('color', 10);
            $table->integer('puertas');                     
            $table->boolean('status');  
            $table-> unsignedBigInteger('id_cliente');
            $table->date('fechareg');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehiculos');
    }
};
