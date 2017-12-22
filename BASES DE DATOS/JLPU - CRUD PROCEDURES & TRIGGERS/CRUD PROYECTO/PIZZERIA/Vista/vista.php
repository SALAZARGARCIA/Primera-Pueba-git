<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$prod = new Pizzeria();
$model = new PizzeriaModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $prod->__SET('Nit_Pizzeria',        $_REQUEST['Nit_Pizzeria']);
            $prod->__SET('Nom_Pizzeria',        $_REQUEST['Nom_Pizzeria']);
            $prod->__SET('Dir_Pizzeria',        $_REQUEST['Dir_Pizzeria']);
            $prod->__SET('Tel_Pizzeria',        $_REQUEST['Tel_Pizzeria']);
            $prod->__SET('Cel_Pizzeria',        $_REQUEST['Cel_Pizzeria']);
            $prod->__SET('Logo_Pizzeria',       $_REQUEST['Logo_Pizzeria']);
            $prod->__SET('Nit_Pizzeria2',       $_REQUEST['Nit_Pizzeria2']);
            
            $model->Actualizar_prod($prod);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $prod->__SET('Nit_Pizzeria',        $_REQUEST['Nit_Pizzeria']);
            $prod->__SET('Nom_Pizzeria',        $_REQUEST['Nom_Pizzeria']);
            $prod->__SET('Dir_Pizzeria',        $_REQUEST['Dir_Pizzeria']);
            $prod->__SET('Tel_Pizzeria',        $_REQUEST['Tel_Pizzeria']);
            $prod->__SET('Cel_Pizzeria',        $_REQUEST['Cel_Pizzeria']);
            $prod->__SET('Logo_Pizzeria',       $_REQUEST['Logo_Pizzeria']);
            

            $model->Registrar_prod($prod);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_prod($_REQUEST['Nit_Pizzeria']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $prod = $model->Obtener_prod($_REQUEST['Nit_Pizzeria']);
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
   		
   		<label for="user_login">NIT PIZZERIA</label><br>
   		<input type="text" name="Nit_Pizzeria" placeholder="produmento" required><br>

   		<br><label for="use_pass">NOMBRE PIZZERIA</label><br>
   		<input type="text" name="Nom_Pizzeria" placeholder="Descripcion producto" required><br><br>

      <label for="user_login">DIRECCION PIZZERIA</label><br>
      <input type="text" name="Dir_Pizzeria" placeholder="produmento" required><br><br>

      <label for="user_login">TELEFONO PIZZERIA</label><br>
      <input type="text" name="Tel_Pizzeria" placeholder="produmento" required><br><br>
      
      <label for="user_login">CELULAR DPIZZERIA</label><br>
      <input type="text" name="Cel_Pizzeria" placeholder="produmento" required><br><br>

      <label for="user_login">LOGO MINIMO DEL PIZZERIA</label><br>
      <input type="text" name="Logo_Pizzeria" placeholder="produmento" required><br><br>


   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['prod']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>NIT PIZZERIA</label>

      

      <input type="text" name="Nit_Pizzeria" value="<?php echo $prod->__GET('Nit_Pizzeria'); ?>" style="display:none" placeholder="produmento" required>

     <!--CAMPO QUE GUARDA EL  prod -->

     <br><input type="text" name="Nit_Pizzeria2" id="user_login" value="<?php echo $prod->__GET('Nit_Pizzeria');?>"><br>

     

      <br><label>NOMBRE PIZZERIA</label>

      <br><input type="text" name="Nom_Pizzeria" id="user_login" value="<?php echo $prod->__GET('Nom_Pizzeria');?>"><br>


      <br><label>DIRECCION PIZZERIA</label>

      <br><input type="text" name="Dir_Pizzeria" id="user_login" value="<?php echo $prod->__GET('Dir_Pizzeria');?>"><br>


      <br><label>TELEFONO PIZZERIA</label>

      <br><input type="text" name="Tel_Pizzeria" id="user_login" value="<?php echo $prod->__GET('Tel_Pizzeria');?>"><br>


      <br><label>CELULAR DPIZZERIA</label>

      <br><input type="text" name="Cel_Pizzeria" id="user_login" value="<?php echo $prod->__GET('Cel_Pizzeria');?>"><br>


      <br><label>LOGO MINIMO DEL PIZZERIA</label>

      <br><input type="text" name="Logo_Pizzeria" id="user_login" onkeypress="return justNumbers(event);" value="<?php echo $prod->__GET('Logo_Pizzeria');?>"><br>



      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM Pizzeria";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="costumers">
      <thead>
        <tr>
          <th>NIT PIZZERIA</th>
          <th>NOMBRE PIZZERIA</th>
          <th>DIRECCION PIZZERIA</th>
          <th>TELEFONO PIZZERIA</th>
          <th>CELULAR DPIZZERIA</th>
          <th>LOGO MINIMO DEL PIZZERIA</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_prod() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Nit_Pizzeria');?></td>
          <td><?php echo $r->__GET('Nom_Pizzeria');?> </td>
          <td><?php echo $r->__GET('Dir_Pizzeria');?></td>
          <td><?php echo $r->__GET('Tel_Pizzeria');?> </td>
          <td><?php echo $r->__GET('Cel_Pizzeria');?></td>
          <td><?php echo $r->__GET('Logo_Pizzeria');?> </td>
        
          <td>
            <a href="?action=editar&Nit_Pizzeria=<?php echo $r->Nit_Pizzeria; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Nit_Pizzeria=<?php echo $r->Nit_Pizzeria; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


