<?php
class RolModel
{
	private $pdo;

	 public function __CONSTRUCT()
    {
        try
        {
            $this->pdo = new PDO('mysql:host=localhost;dbname=sidpla', 'root', '');
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
			$sql = "INSERT INTO rol (Cod_rol, Desc_rol) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_rol'),
					$data->__GET('Desc_rol')
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

            	$rol->__SET('Cod_rol', $r->Cod_rol);
            	$rol->__SET('Desc_rol', $r->Desc_rol);

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
                        Cod_rol             = ?,
                        Desc_rol      = ? 
                        
                    WHERE Cod_rol =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_rol2'), 
                    $data->__GET('Desc_rol'), 
                    $data->__GET('Cod_rol')
                    
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
                      ->prepare("DELETE FROM Rol WHERE Cod_rol = ?");                      

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
                      ->prepare("SELECT * FROM rol WHERE Cod_rol = ?");
                      

            $stm->execute(array($Rol));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $rol = new Rol();


               $rol->__SET('Cod_rol', $r->Cod_rol);
               $rol->__SET('Desc_rol', $r->Desc_rol);

            return $rol;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>