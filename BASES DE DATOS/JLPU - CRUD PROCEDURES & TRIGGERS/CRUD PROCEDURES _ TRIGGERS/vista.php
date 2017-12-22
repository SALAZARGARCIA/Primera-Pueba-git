<?php
require_once 'control.php';
require_once 'modelo.php';
require_once 'conexion.php';

$rol = new Rol();
$model = new RolModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $rol->__SET('Rol',              $_REQUEST['Rol']);
            $rol->__SET('estado_rol',       $_REQUEST['estado_rol']);
            $rol->__SET('Rol2',             $_REQUEST['Rol2']);
            
            $model->Actualizar_rol($rol);
            print "<script>alert(\"Registr actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $rol->__SET('Rol',                 $_REQUEST['Rol']);
            $rol->__SET('estado_rol',          $_REQUEST['estado_rol']);
           
            

            $model->Registrar_Rol($rol);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_Rol($_REQUEST['Rol']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $rol = $model->Obtener_Rol($_REQUEST['Rol']);
            break;
    }
}

?>


<!DOCTYPE html>
<html lang="es">
   <head>
   	<title>CRUD BASES DE DATOS</title>
    <link rel="stylesheet" type="text/css" href="estilos.css">

   </head>
   <body>

<!--FORMULARIO NUECO REGISTRO-->

   	<br><a href="?action=&m1">NUEVO REGISTRO</a><br><br>

   	<div id="main-container1">
   	<?php if( !empty($_GET['m']) && !empty($_GET['action']) )?>
    

   	<!--FORMULARIO REGISTRO-->

   	<form action="#" method="post">
   		
   		<label for="user_login">ROL</label>
   		<input type="text" name="Rol" placeholder="Rol" required>

   		<label for="use_pass">Estado rol</label><br>
   		ACTIVO <input type="radio" name="estado_rol" value="1" checked>
   		INACTIVO <input type="radio" name="estado_rol" value="0">

   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="main-container1">
      <?php if(!empty($_GET['Rol']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>ROL POR MODIFICAR</label>

      



      <br><input type="text" name="Rol" value="<?php echo $rol->__GET('Rol'); ?>" style="display:none" placeholder="ROL" required>

     <!--CAMPO QUE GUARDA EL  Rol -->

     <br><input type="text" name="Rol2" id="user_login" value="<?php echo $rol->__GET('Rol');?>">

     

      <br><label>ESTADO ROL</label><br>

      <br>ACTIVO<input type="radio" name="estado_rol" value="1" checked="<?php echo ($rol->__GET('estado_rol') ==1)?'checked':'';?> ">

      <br>INACTIVO<input type="radio" name="estado_rol" value="0" checked="<?php echo ($rol->__GET('estado_rol') ==0)?'checked':'';?> ">

      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM rol";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="main-container">
      <thead>
        <tr>
          <th>ROL</th>
          <th>ESTADO ROL</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_rol() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Rol');?></td>
          <td>
            <?php
            if ($r->__GET('estado_rol')==1) {
              echo "ACTIVO";
            }else{
              echo "INACTIVO";
            }?></td>
          <td>
            <a href="?action=editar&Rol=<?php echo $r->Rol; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Rol=<?php echo $r->Rol; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
          </td>
          </tr>

    <?php endforeach; ?>
    </table>

  <?php else: ?>

        <h4 class="alert alert-danger">SEÑOR USUARIO NO SE ENCUENTRAN REGISTROS!!!</h4>
      <?php endif;?>

        
    
   </body>

</div>
</body>
</html>


