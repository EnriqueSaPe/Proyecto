@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header" text>{{ __('Dashboard') }}</div>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/Yyr6oR4O5dc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@extends('adminlte::page')
//implementa la vista de adminlte

@section('title', 'Dashboard')
//agregamos un titulo 

@section('content_header')
    <h1>Dashboard</h1> 
@stop
//Agregamos un header a nuestra pagina 

@section('content')
    <p>Welcome to this beautiful admin panel.</p>
@stop

//Contenido de nuestra pagina

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

//agregamos css

@section('js')
    <script> console.log('Hi!'); </script>
@stop

//agregamos Java Script