<?php
class TipoProdModel
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
		

	public function Registrar_prod(Tipo_producto $data)
	{
		try
		{
			$sql = "INSERT INTO Tipo_producto  (Cod_tipo_prod, Desc_tipo_prod) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_tipo_prod'),
					$data->__GET('Desc_tipo_prod')
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

            $stm = $this->pdo->prepare("SELECT * FROM Tipo_producto");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$prod = new Tipo_producto();

            	$prod->__SET('Cod_tipo_prod', $r->Cod_tipo_prod);
            	$prod->__SET('Desc_tipo_prod', $r->Desc_tipo_prod);

            	$result[] = $prod;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_prod(Tipo_producto $data)
    {
        try 
        {
            $sql = "UPDATE Tipo_producto SET 
                        Cod_tipo_prod             = ?,
                        Desc_tipo_prod      = ? 
                        
                    WHERE Cod_tipo_prod =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_tipo_prod2'), 
                    $data->__GET('Desc_tipo_prod'), 
                    $data->__GET('Cod_tipo_prod')
                    
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
                      ->prepare("DELETE FROM Tipo_producto WHERE Cod_tipo_prod = ?");                      

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
                      ->prepare("SELECT * FROM Tipo_producto WHERE Cod_tipo_prod = ?");
                      

            $stm->execute(array($prod));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $prod = new Tipo_producto();


               $prod->__SET('Cod_tipo_prod', $r->Cod_tipo_prod);
               $prod->__SET('Desc_tipo_prod', $r->Desc_tipo_prod);

            return $prod;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>