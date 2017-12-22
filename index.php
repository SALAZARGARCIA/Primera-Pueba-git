<!DOCTYPE html>
<html lang="en">
<head>
<title>Mi Proyecto</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<header>
<nav class="navbar navbar-inverse"><!—Crear el menu -->
<div class="container-fluid">
<div class="navbar-header">
<a class="navbar-brand" href="#">WebSiteName</a>
</div>
<ul class="nav navbar-nav">
<li class="active"><a href="#">Home</a></li>
<li><a href="#">Page 1</a></li>
<li><a href="#">Page 2</a></li>
</ul>
<ul class="nav navbar-nav navbar-right">
<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign
Up</a></li>
<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
Login</a></li>
</ul>
</div>
</nav>
</header>
<center>
	<h1>Boostrap</h1>
</center>
<div class="container">
<div class="row">

<div class="col-md-2 column margintop20">
<ul class="nav nav-pills nav-stacked">
<li><a href="#"><span class="glyphicon glyphicon-tower"></span> Home</a></li>
<li class="active"><a href="#">Formularios<span class="glyphicon glyphicon-new-window pull-right"></span> </a></li>
<li><a href="#">Condicionales<span class="glyphicon glyphicon-hand-left pull-right"></span> </a></li>
<li><a href="#">Repetitivas<span class="glyphicon glyphicon-cog pull-right"></span> </a></li>
<li><a href="#">Seguridad<span class="glyphicon glyphicon-briefcase pull-right"></span> </a></li>
<li><a href="#">Base de datos<span class="glyphicon glyphicon-chevron-right pull-right"></span> </a></li>
</ul>
</div>
<div class="col-sm-10 col-md-10">
<div class="panel panel-default">
<!-- contenedor del titulo-->
<div class="panel-heading">
<h3 class="panel-title">EJERCICIOS DE PRACTICA PHP</h3>
</div>
<!-- contenedor de descripcion ejercicios-->
<div class="panel-body">
<p style="color:#DCA430">Ejercicios de uso de formularios (Text - Radio - Check - Select) y su tratamiento con PHP.
$_REQUEST - $_POST - $_GET </p>
<!-- contenedor menu de ejercicios-->
<p><ul class="nav nav-tabs">
<li class="active"><a href="#">Text /Button - Triangulo</a></li>
<li><a href="#">Check - Ingredientes</a></li>
<li><a href="#">Radio - Edades</a></li>
<li><a href="#">Select - Paises</a></li>
</ul></p>


<!-- Contenedor ejercicio-->
<div class="alert alert-success">
<div class="row">
<div class="col-sm-12 col-md-12">
<form name="areat" action="">
<table class="table">
<tr><td colspan="2" style="color:#000000">Ejercicio Area triangulo: Digite los datos y al oprimir el boton, se
realicen los calculos</td></tr>
<tr><td align="right">Base</td><td><input name="base" type="text"></td></tr>
<tr><td align="right">Altura</td><td><input name="altura" type="text"></td></tr>
<tr><td colspan="2" align="center"><input value="CALCULAR" type="submit" width="500"
style="color:#000000"></td></tr>
<tr><td align="right">Resultado Area</td><td><input name="area" type="text"
disabled="disabled"></td></tr>
</table>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>