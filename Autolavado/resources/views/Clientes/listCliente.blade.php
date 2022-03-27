<h1>Lista de Clientes</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Apellido</th>
      <th scope="col">Direccion</th>
      <th scope="col">Teléfono</th>
      <th scope="col">Correo</th>
      <th scope="col">Estatus</th>
      <th scope="col">Eliminar | Editar</th>
    </tr>
  </thead>
  <tbody>
      @foreach($clientes as $cliente)
    <tr>
      <td>{{$cliente->id_cliente}}</td>
      <td>{{$cliente->nombre}}</td>
      <td>{{$cliente->apaterno}}</td>
      <td>{{$cliente->amaterno}}</td>
      <td>{{$cliente->direccion}}</td>
      <td>{{$cliente->telefono}}</td>
      <td>{{$cliente->correo}}</td>
      <td>{{$cliente->status}}</td>
    </tr>
    </tr>
     @endforeach

  </tbody>
</table>