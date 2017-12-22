<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$rol = new Rol();
$model = new RolModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $rol->__SET('Cod_rol',          $_REQUEST['Cod_rol']);
            $rol->__SET('Desc_rol',         $_REQUEST['Desc_rol']);
            $rol->__SET('Cod_rol2',         $_REQUEST['Cod_rol2']);
            
            $model->Actualizar_rol($rol);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $rol->__SET('Cod_rol',             $_REQUEST['Cod_rol']);
            $rol->__SET('Desc_rol',            $_REQUEST['Desc_rol']);
           
            

            $model->Registrar_Rol($rol);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_Rol($_REQUEST['Cod_rol']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $rol = $model->Obtener_Rol($_REQUEST['Cod_rol']);
            break;
    }
}

?>


<!DOCTYPE html>
<html lang="es">
   <head>
   	<title>CRUD BASES DE DATOS</title>
   	<link rel="stylesheet" type="text/css" href="">

   </head>
   <body>

<!--FORMULARIO NUEVO REGISTRO-->

   	<br><a href="?action=&m1">NUEVO REGISTRO</a><br><br>

   	<div id="div_form">
   	<?php if( !empty($_GET['m']) && !empty($_GET['action']) )?>
    

   	<!--FORMULARIO REGISTRO-->

   	<form action="#" method="post">
   		
   		<label for="user_login">ROL</label><br>
   		<input type="text" name="Cod_rol" placeholder="Rol" required><br><br>

   		<br><label for="use_pass">DESCRIPCION ROL</label><br>
   		<input type="text" name="Desc_rol" placeholder="Rol" required>

   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['Rol']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>ROL POR MODIFICAR</label>

      



      <br><input type="text" name="Cod_rol" value="<?php echo $rol->__GET('Cod_rol'); ?>" style="display:none" placeholder="ROL" required>

     <!--CAMPO QUE GUARDA EL  Rol -->

     <br><input type="text" name="Cod_rol2" id="user_login" value="<?php echo $rol->__GET('Cod_rol');?>">

     

      <br><label>DESCRIPCION ROL</label><br>

      <br><input type="text" name="Desc_rol" id="user_login" value="<?php echo $rol->__GET('Desc_rol');?>">


      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM rol";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="costumers">
      <thead>
        <tr>
          <th>ROL</th>
          <th>DESCRIPCION ROL</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_rol() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Cod_rol');?></td>
          <td><?php echo $r->__GET('Desc_rol');?> </td>
          <td>
            <a href="?action=editar&Cod_rol=<?php echo $r->Cod_rol; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Cod_rol=<?php echo $r->Cod_rol; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


