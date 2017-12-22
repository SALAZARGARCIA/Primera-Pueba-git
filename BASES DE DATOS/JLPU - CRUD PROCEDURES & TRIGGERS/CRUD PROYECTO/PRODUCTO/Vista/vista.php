<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$prod = new Producto();
$model = new ProdModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $prod->__SET('Cod_producto',         $_REQUEST['Cod_producto']);
            $prod->__SET('Nom_prod',             $_REQUEST['Nom_prod']);
            $prod->__SET('Desc_prod',            $_REQUEST['Desc_prod']);
            $prod->__SET('Foto_prod',            $_REQUEST['Foto_prod']);
            $prod->__SET('Tipo_producto',        $_REQUEST['Tipo_producto']);
            $prod->__SET('Stok_min',             $_REQUEST['Stok_min']);
            $prod->__SET('Stok_max',             $_REQUEST['Stok_max']);
            $prod->__SET('Cantidad_exist',       $_REQUEST['Cantidad_exist']);
            $prod->__SET('Cod_producto2',        $_REQUEST['Cod_producto2']);
            
            $model->Actualizar_prod($prod);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $prod->__SET('Cod_producto',         $_REQUEST['Cod_producto']);
            $prod->__SET('Nom_prod',             $_REQUEST['Nom_prod']);
            $prod->__SET('Desc_prod',            $_REQUEST['Desc_prod']);
            $prod->__SET('Foto_prod',            $_REQUEST['Foto_prod']);
            $prod->__SET('Tipo_producto',        $_REQUEST['Tipo_producto']);
            $prod->__SET('Stok_min',             $_REQUEST['Stok_min']);
            $prod->__SET('Stok_max',             $_REQUEST['Stok_max']);
            $prod->__SET('Cantidad_exist',       $_REQUEST['Cantidad_exist']);
            

            $model->Registrar_prod($prod);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_prod($_REQUEST['Cod_producto']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $prod = $model->Obtener_prod($_REQUEST['Cod_producto']);
            break;
    }
}

?>


<!DocTYPE html>
<html lang="es">
   <head>
   	<title>CRUD BASES DE DATOS</title>
   	<link rel="stylesheet" type="text/css" href="">
    <

   </head>
   <body>

<!--FORMULARIO NUEVO REGISTRO-->

   	<br><a href="?action=&m1">NUEVO REGISTRO</a><br><br>

   	<div id="div_form">
   	<?php if( !empty($_GET['m']) && !empty($_GET['action']) )?>
    

   	<!--FORMULARIO REGISTRO-->

   	<form action="#" method="post">
   		
   		<label for="user_login">PRODUCTO</label><br>
   		<input type="text" name="Cod_producto" placeholder="produmento" required><br>

   		<br><label for="use_pass">NOMBRE PRODUCTO</label><br>
   		<input type="text" name="Nom_prod" placeholder="Descripcion producto" required><br><br>

      <label for="user_login">DESCRIPCION PRODUCTO</label><br>
      <input type="text" name="Desc_prod" placeholder="produmento" required><br><br>

      <label for="user_login">FOTO PRODUCTO</label><br>
      <input type="text" name="Foto_prod" placeholder="produmento" required><br><br>
      
      <label for="user_login">TIPO DE PRODUCTO</label><br>
      <input type="text" name="Tipo_producto" placeholder="produmento" required><br><br>

      <label for="user_login">STOK MINIMO DEL PRODUCTO</label><br>
      <input type="text" name="Stok_min" placeholder="produmento" required><br><br>

      <label for="user_login">STOK MAXIMO DELPRODUCTO</label><br>
      <input type="text" name="Stok_max" placeholder="produmento" required><br><br>

      <label for="user_login">CANTIDAD EXISTENTE DEL PRODUCTO</label><br>
      <input type="text" name="Cantidad_exist" placeholder="produmento" required>


   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['prod']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>PRODUCTO POR MODIFICAR</label>

      



      <input type="text" name="Cod_producto" value="<?php echo $prod->__GET('Cod_producto'); ?>" style="display:none" placeholder="produmento" required>

     <!--CAMPO QUE GUARDA EL  prod -->

     <br><input type="text" name="Cod_producto2" id="user_login" value="<?php echo $prod->__GET('Cod_producto');?>"><br>

     

      <br><label>NOMBRE PRODUCTO PRODUCTO</label>

      <br><input type="text" name="Nom_prod" id="user_login" value="<?php echo $prod->__GET('Nom_prod');?>"><br>


      <br><label>DESCRIPCION PRODUCTO</label>

      <br><input type="text" name="Desc_prod" id="user_login" value="<?php echo $prod->__GET('Desc_prod');?>"><br>


      <br><label>FOTO PRODUCTO</label>

      <br><input type="text" name="Foto_prod" id="user_login" value="<?php echo $prod->__GET('Foto_prod');?>"><br>


      <br><label>TIPO DE PRODUCTO</label>

      <br><input type="text" name="Tipo_producto" id="user_login" value="<?php echo $prod->__GET('Tipo_producto');?>"><br>


      <br><label>STOK MINIMO DEL PRODUCTO</label>

      <br><input type="text" name="Stok_min" id="user_login" onkeypress="return justNumbers(event);" value="<?php echo $prod->__GET('Stok_min');?>"><br>


      <br><label>STOK MAXIMO DEL  PRODUCTO</label>

      <br><input type="text" name="Stok_max" id="user_login" onkeypress="return justNumbers(event);" value="<?php echo $prod->__GET('Stok_max');?>" ><br>


      <br><label>CANTIDAD EXISTENTE DEL PRODUCTO</label>

      <br><input type="text" name="Cantidad_exist" id="user_login" value="<?php echo $prod->__GET('Cantidad_exist');?>"><br>




      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM Tipo_producto";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="costumers">
      <thead>
        <tr>
          <th>PRODUCTO</th>
          <th>NOMBRE PRODUCTO</th>
          <th>DRIPCION PRODUCTO</th>
          <th>FOTO PRODUCTO</th>
          <th>TIPO DE PRODUCTO</th>
          <th>STOK MINIMO DEL PRODUCTO PRODUCTO</th>
          <th>STOK MAXIMO DEL PRODUCTO PRODUCTO</th>
          <th>CANTIDAD EXISTENTE DEL PRODUCTO</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_prod() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Cod_producto');?></td>
          <td><?php echo $r->__GET('Nom_prod');?> </td>
          <td><?php echo $r->__GET('Desc_prod');?></td>
          <td><?php echo $r->__GET('Foto_prod');?> </td>
          <td><?php echo $r->__GET('Tipo_producto');?></td>
          <td><?php echo $r->__GET('Stok_min');?> </td>
          <td><?php echo $r->__GET('Stok_max');?></td>
          <td><?php echo $r->__GET('Cantidad_exist');?> </td>
          <td>
            <a href="?action=editar&Cod_producto=<?php echo $r->Cod_producto; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Cod_producto=<?php echo $r->Cod_producto; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


