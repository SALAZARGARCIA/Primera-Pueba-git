<?php
require_once '../Controlador/control.php';
require_once '../Modelo/modelo.php';
require_once '../Controlador/conexion.php';

$doc = new Tipo_doc();
$model = new docModel();
$db = database::conectar();

if(isset($_REQUEST['action']))
{
    switch($_REQUEST['action'])
    {
        case 'actualizar':
            $doc->__SET('Cod_tipo_doc',                 $_REQUEST['Cod_tipo_doc']);
            $doc->__SET('Descripcion_tipo_doc',         $_REQUEST['Descripcion_tipo_doc']);
            $doc->__SET('Cod_tipo_doc2',                $_REQUEST['Cod_tipo_doc2']);
            
            $model->Actualizar_doc($doc);
            print "<script>alert(\"Registro actualizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'registrar':
			      $doc->__SET('Cod_tipo_doc',             $_REQUEST['Cod_tipo_doc']);
            $doc->__SET('Descripcion_tipo_doc',     $_REQUEST['Descripcion_tipo_doc']);
           
            

            $model->Registrar_doc($doc);
            print "<script>alert(\"Registro realizado exitosamente.\");window.location='vista.php'; </script>";
            break;

        case 'eliminar':
            $model->Eliminar_doc($_REQUEST['Cod_tipo_doc']);
            print "<script>alert(\"Registro ELIMINADO exitosamente.\");window.location='vista.php'; </script>";            
            break;

        case 'editar':
            $doc = $model->Obtener_doc($_REQUEST['Cod_tipo_doc']);
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
   		
   		<label for="user_login">DOCUMENTO</label><br>
   		<input type="text" name="Cod_tipo_doc" placeholder="Documento" required><br><br>

   		<br><label for="use_pass">DESCRIPCION DOCUMENTO</label><br>
   		<input type="text" name="Descripcion_tipo_doc" placeholder="Documento" required>

   		<br><input type="submit" value="Guardar" onclick="this.form.action = '?action=registrar';"/>
   	</form>
   	</div>

   
   	<!--FIN FORMULARIO REGISTRO-->

   	
    <!--FORMULARIO ACTUALIZAR REGISTRO-->
    
    <div id="div_form">
      <?php if(!empty($_GET['doc']) && !empty($_GET['action']) )  ?> 

      <form action='#' method="post">



      <br><br><label>DOCUMENTO POR MODIFICAR</label>

      



      <input type="text" name="Cod_tipo_doc" value="<?php echo $doc->__GET('Cod_tipo_doc'); ?>" style="display:none" placeholder="documento" required>

     <!--CAMPO QUE GUARDA EL  doc -->

     <br><input type="text" name="Cod_tipo_doc2" id="user_login" value="<?php echo $doc->__GET('Cod_tipo_doc');?>"><br>

     

      <br><label>DESCRIPCION DOCUMENTO</label>

      <br><input type="text" name="Descripcion_tipo_doc" id="user_login" value="<?php echo $doc->__GET('Descripcion_tipo_doc');?>">


      <br><input type="submit" value="Actualizar" onclick="this.form.action = '?action=actualizar';"/>
    </form>
    </div>

    <!--FIN FORMULARIO ACTUALIZAR REGISTRO-->

    <?php
     $sqll= "SELECT * FROM Tipo_doc";

     $query = $db->query($sqll);

     if($query->rowCount()>0):?>



    <br><h1>CONSULTA REGISTROS</h1><br>
    <table id="costumers">
      <thead>
        <tr>
          <th>doc</th>
          <th>DESCRIPCION doc</th>
          <th>FUNCION EDITAR</th>
          <th>FUNCION ELIMINAR</th>
        </tr>
      </thead>
      <?php foreach ($model->Listar_doc() as $r):?> 
        <tr>

          <td><?php echo $r->__GET('Cod_tipo_doc');?></td>
          <td><?php echo $r->__GET('Descripcion_tipo_doc');?> </td>
          <td>
            <a href="?action=editar&Cod_tipo_doc=<?php echo $r->Cod_tipo_doc; ?>" )">EDITAR</a>
          </td>

          <td>
            <a href="?action=eliminar&Cod_tipo_doc=<?php echo $r->Cod_tipo_doc; ?>" onclick="return confirm('¿ESTA SEGURO DE ELIMINAR ESTE USUARIO?')">ELIMINAR</a>
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


