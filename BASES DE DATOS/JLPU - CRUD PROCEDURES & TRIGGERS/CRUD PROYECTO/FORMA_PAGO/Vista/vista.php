<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$prod = new Forma_pago();
$model = new TipoProdModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $prod->__SET('Cod_Forma_pago',                 $_REQUEST['Cod_Forma_pago']);
            $prod->__SET('Desc_fpago',                     $_REQUEST['Desc_fpago']);
            $prod->__SET('Cod_Forma_pago2',                $_REQUEST['Cod_Forma_pago2']);
            
            $model->Actualizar_prod($prod);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $prod->__SET('Cod_Forma_pago',             $_REQUEST['Cod_Forma_pago']);
            $prod->__SET('Desc_fpago',                 $_REQUEST['Desc_fpago']);
           
            

            $model->Registrar_prod($prod);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_prod($_REQUEST['Cod_Forma_pago']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $prod = $model->Obtener_prod($_REQUEST['Cod_Forma_pago']);
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
   		
   		<label for="user_login">PRODUCTO</label><br>
   		<input type="text" name="Cod_Forma_pago" placeholder="produmento" required><br><br>

   		<br><label for="use_pass">DESCRIPCION PRODUCTO</label><br>
   		<input type="text" name="Desc_fpago" placeholder="Descripcion producto" required>

   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['prod']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>PRODUCTO POR MODIFICAR</label>

      



      <input type="text" name="Cod_Forma_pago" value="<?php echo $prod->__GET('Cod_Forma_pago'); ?>" style="display:none" placeholder="produmento" required>

     <!--CAMPO QUE GUARDA EL  prod -->

     <br><input type="text" name="Cod_Forma_pago2" id="user_login" value="<?php echo $prod->__GET('Cod_Forma_pago');?>"><br>

     

      <br><label>DESCRIPCION PRODUCTO</label>

      <br><input type="text" name="Desc_fpago" id="user_login" value="<?php echo $prod->__GET('Desc_fpago');?>">


      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM Forma_pago";

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

          <td><?php echo $r->__GET('Cod_Forma_pago');?></td>
          <td><?php echo $r->__GET('Desc_fpago');?> </td>
          <td>
            <a href="?action=editar&Cod_Forma_pago=<?php echo $r->Cod_Forma_pago; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Cod_Forma_pago=<?php echo $r->Cod_Forma_pago; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


