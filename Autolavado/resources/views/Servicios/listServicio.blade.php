<h1>Lista de Clientes</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Descripción</th>
      <th scope="col">Costo</th>
      <th scope="col">Estatus</th>
      <th scope="col">Eliminar | Editar</th>
    </tr>
  </thead>
  <tbody>
      @foreach($servicios as $servicio)
    <tr>
      <td>{{$servicio->id_servicio}}</td>
      <td>{{$servicio->description}}</td>
      <td>{{$servicio->costo}}</td>
      <td>{{$servicio->status}}</td>
      <td>{{$servicio->fechareg}}</td>
    </tr>
    </tr>
     @endforeach

  </tbody>
</table>