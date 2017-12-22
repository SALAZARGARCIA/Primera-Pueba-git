H<?php
class PizzeriaModel
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
		

	public function Registrar_prod(Pizzeria $data)
	{
		try
		{
			$sql = "INSERT INTO Pizzeria (Nit_Pizzeria, Nom_Pizzeria, Dir_Pizzeria, Tel_Pizzeria,Cel_Pizzeria, Logo_Pizzeria) VALUES (?, ?, ?, ?, ?, ?) "; $this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Nit_Pizzeria'),
					$data->__GET('Nom_Pizzeria'),
                    $data->__GET('Dir_Pizzeria'),
                    $data->__GET('Tel_Pizzeria'),
                    $data->__GET('Cel_Pizzeria'),
                    $data->__GET('Logo_Pizzeria')                    
					)
				);
		} catch (Exeption $e)
		{
			die($e->getMessage());
		}
	}

	 public function Listar_prod()
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM Pizzeria");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$prod = new Pizzeria();

            	$prod->__SET('Nit_Pizzeria',       $r->Nit_Pizzeria);
            	$prod->__SET('Nom_Pizzeria',       $r->Nom_Pizzeria);
                $prod->__SET('Dir_Pizzeria',       $r->Dir_Pizzeria);
                $prod->__SET('Tel_Pizzeria',       $r->Tel_Pizzeria);
                $prod->__SET('Cel_Pizzeria',       $r->Cel_Pizzeria);
                $prod->__SET('Logo_Pizzeria',      $r->Logo_Pizzeria);
                

            	$result[] = $prod;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_prod(Pizzeria $data)
    {
        try 
        {
            $sql = "UPDATE Pizzeria SET 
                        Nit_Pizzeria     = ?,
                        Nom_Pizzeria         = ?, 
                        Dir_Pizzeria        = ?,
                        Tel_Pizzeria        = ?, 
                        Cel_Pizzeria    = ?,
                        Logo_Pizzeria         = ? 
                        
                        
                    WHERE Nit_Pizzeria = ?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Nit_Pizzeria2'), 
                    $data->__GET('Nom_Pizzeria'),
                    $data->__GET('Dir_Pizzeria'), 
                    $data->__GET('Tel_Pizzeria'), 
                    $data->__GET('Cel_Pizzeria'), 
                    $data->__GET('Logo_Pizzeria'),  
                    $data->__GET('Nit_Pizzeria')
                    
                    )
                );
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


    public function Eliminar_prod($prod)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("DELETE FROM Pizzeria WHERE Nit_Pizzeria = ?");                      

            $stm->execute(array($prod));
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


  public function Obtener_prod($prod)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("SELECT * FROM Pizzeria WHERE Nit_Pizzeria = ?");
                      

            $stm->execute(array($prod));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $prod = new Pizzeria();


                $prod->__SET('Nit_Pizzeria',    $r->Nit_Pizzeria);
                $prod->__SET('Nom_Pizzeria',    $r->Nom_Pizzeria);
                $prod->__SET('Dir_Pizzeria',    $r->Dir_Pizzeria);
                $prod->__SET('Tel_Pizzeria',    $r->Tel_Pizzeria);
                $prod->__SET('Cel_Pizzeria',    $r->Cel_Pizzeria);
                $prod->__SET('Logo_Pizzeria',   $r->Logo_Pizzeria);
              
        return $prod;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>