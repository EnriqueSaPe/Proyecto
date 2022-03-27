<h1>Lista de Clientes</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Matrícula</th>
      <th scope="col">Tipo</th>
      <th scope="col">Marca</th>
      <th scope="col">Modelo</th>
      <th scope="col">Color</th>
      <th scope="col">Puertas</th>
      <th scope="col">Estatus</th>
      <th scope="col">Cliente</th>
      <th scope="col">Registro</th>
      <th scope="col">Eliminar | Editar</th>
    </tr>
  </thead>
  <tbody>
      @foreach($vehiculos as $vehiculo)
    <tr>
      <td>{{$vehiculo->id_vehiculo}}</td>
      <td>{{$vehiculo->matricula}}</td>
      <td>{{$vehiculo->tipo}}</td>
      <td>{{$vehiculo->marca}}</td>
      <td>{{$vehiculo->modelo}}</td>
      <td>{{$vehiculo->color}}</td>
      <td>{{$vehiculo->puertas}}</td>
      <td>{{$vehiculo->status}}</td>
      <td>{{$vehiculo->id_cliente}}</td>
      <td>{{$vehiculo->fechareg}}</td>
    </tr>
    </tr>
     @endforeach

  </tbody>
</table>