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
		

	public function Registrar_prod(Forma_pago $data)
	{
		try
		{
			$sql = "INSERT INTO Forma_pago(Cod_Forma_pago, Desc_fpago) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_Forma_pago'),
					$data->__GET('Desc_fpago')
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

            $stm = $this->pdo->prepare("SELECT * FROM Forma_pago");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$prod = new Forma_pago();

            	$prod->__SET('Cod_Forma_pago', $r->Cod_Forma_pago);
            	$prod->__SET('Desc_fpago', $r->Desc_fpago);

            	$result[] = $prod;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_prod(Forma_pago $data)
    {
        try 
        {
            $sql = "UPDATE Forma_pago SET 
                        Cod_Forma_pago             = ?,
                        Desc_fpago      = ? 
                        
                    WHERE Cod_Forma_pago =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_Forma_pago2'), 
                    $data->__GET('Desc_fpago'), 
                    $data->__GET('Cod_Forma_pago')
                    
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
                      ->prepare("DELETE FROM Forma_pago WHERE Cod_Forma_pago = ?");                      

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
                      ->prepare("SELECT * FROM Forma_pago WHERE Cod_Forma_pago = ?");
                      

            $stm->execute(array($prod));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $prod = new Forma_pago();


               $prod->__SET('Cod_Forma_pago', $r->Cod_Forma_pago);
               $prod->__SET('Desc_fpago', $r->Desc_fpago);

            return $prod;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>