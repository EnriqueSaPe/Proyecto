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
      <th scope="col">Tipo</th>
      <th scope="col">Eliminar | Editar</th>
    </tr>
  </thead>
  <tbody>
      @foreach($trabajadores as $trabajador)
    <tr>
      <td>{{$trabajador->id_trabajador}}</td>
      <td>{{$trabajador->nombre}}</td>
      <td>{{$trabajador->apaterno}}</td>
      <td>{{$trabajador->amaterno}}</td>
      <td>{{$trabajador->direccion}}</td>
      <td>{{$trabajador->telefono}}</td>
      <td>{{$trabajador->correo}}</td>
      <td>{{$trabajador->tipo}}</td>
    </tr>
    </tr>
     @endforeach

  </tbody>
</table>