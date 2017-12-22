<?php
class RolModel
{
	private $pdo;

	 public function __CONSTRUCT()
    {
        try
        {
            $this->pdo = new PDO('mysql:host=localhost;dbname=proced_trigger', 'root', '');
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);                
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
		

	public function Registrar_Rol(Rol $data)
	{
		try
		{
			$sql = "INSERT INTO rol (Rol, estado_rol) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Rol'),
					$data->__GET('estado_rol')
					)
				);
		} catch (Exeption $e)
		{
			die($e->getMessage());
		}
	}

	 public function Listar_Rol()
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM rol");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$rol = new Rol();

            	$rol->__SET('Rol', $r->Rol);
            	$rol->__SET('estado_rol', $r->estado_rol);

            	$result[] = $rol;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_Rol(Rol $data)
    {
        try 
        {
            $sql = "UPDATE rol SET 
                        Rol              = ?,
                        estado_rol       = ? 
                        
                    WHERE Rol =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Rol2'), 
                    $data->__GET('estado_rol'), 
                    $data->__GET('Rol')
                    
                    )
                );
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


    public function Eliminar_Rol($Rol)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("DELETE FROM Rol WHERE Rol = ?");                      

            $stm->execute(array($Rol));
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


    public function Obtener_Rol($Rol)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("SELECT * FROM rol WHERE Rol = ?");
                      

            $stm->execute(array($Rol));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $rol = new Rol();


               $rol->__SET('Rol', $r->Rol);
               $rol->__SET('estado_rol', $r->estado_rol);

            return $rol;
         } catch(Exeption $e){
         	die($e->getMessage());
         }





}
}
?>