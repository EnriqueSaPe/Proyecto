<h1>Lista de Clientes</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha</th>
      <th scope="col">Vehiculo</th>
      <th scope="col">Cajero</th>
      <th scope="col">Servicio</th>
      <th scope="col">Trabajador</th>
      <th scope="col">Estatus</th>
      <th scope="col">Eliminar | Editar</th>
    </tr>
  </thead>
  <tbody>
      @foreach($ventas as $venta)
    <tr>
      <td>{{$venta->id_venta}}</td>
      <td>{{$venta->fecha}}</td>
      <td>{{$venta->id_vehiculo}}</td>
      <td>{{$venta->id_cajero}}</td>
      <td>{{$venta->id_servicio}}</td>
      <td>{{$venta->id_trabajador}}</td>
      <td>{{$venta->status}}</td>
    </tr>
    </tr>
     @endforeach

  </tbody>
</table>