<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$prod = new Estado_domicilio();
$model = new EstadoDomicilioModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $prod->__SET('Cod_Estado_dom',                 $_REQUEST['Cod_Estado_dom']);
            $prod->__SET('Desc_estado_dom',                     $_REQUEST['Desc_estado_dom']);
            $prod->__SET('Cod_Estado_dom2',                $_REQUEST['Cod_Estado_dom2']);
            
            $model->Actualizar_prod($prod);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $prod->__SET('Cod_Estado_dom',             $_REQUEST['Cod_Estado_dom']);
            $prod->__SET('Desc_estado_dom',                 $_REQUEST['Desc_estado_dom']);
           
            

            $model->Registrar_prod($prod);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_prod($_REQUEST['Cod_Estado_dom']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $prod = $model->Obtener_prod($_REQUEST['Cod_Estado_dom']);
            break;
    }
}

?>


<!DocTYPE html>
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
   		
   		<label for="user_login">NUMERO DOMICILIO</label><br>
   		<input type="text" name="Cod_Estado_dom" placeholder="produmento" required><br><br>

   		<br><label for="use_pass">ESTADO DOMICILIO</label><br>
   		<input type="text" name="Desc_estado_dom" placeholder="Descripcion producto" required>

   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['prod']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>PRODUCTO POR MODIFICAR</label>

      



      <input type="text" name="Cod_Estado_dom" value="<?php echo $prod->__GET('Cod_Estado_dom'); ?>" style="display:none" placeholder="produmento" required>

     <!--CAMPO QUE GUARDA EL  prod -->

     <br><input type="text" name="Cod_Estado_dom2" id="user_login" value="<?php echo $prod->__GET('Cod_Estado_dom');?>"><br>

     

      <br><label>DESCRIPCION PRODUCTO</label>

      <br><input type="text" name="Desc_estado_dom" id="user_login" value="<?php echo $prod->__GET('Desc_estado_dom');?>">


      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM Estado_domicilio";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="costumers">
      <thead>
        <tr>
          <th>prod</th>
          <th>Desc PRODUCTO</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_prod() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Cod_Estado_dom');?></td>
          <td><?php echo $r->__GET('Desc_estado_dom');?> </td>
          <td>
            <a href="?action=editar&Cod_Estado_dom=<?php echo $r->Cod_Estado_dom; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Cod_Estado_dom=<?php echo $r->Cod_Estado_dom; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


