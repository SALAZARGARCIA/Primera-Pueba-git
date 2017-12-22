<?php
class EstadoDomicilioModel
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
		

	public function Registrar_prod(Estado_domicilio $data)
	{
		try
		{
			$sql = "INSERT INTO Estado_domicilio(Cod_Estado_dom, Desc_estado_dom) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_Estado_dom'),
					$data->__GET('Desc_estado_dom')
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

            $stm = $this->pdo->prepare("SELECT * FROM Estado_domicilio");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$prod = new Estado_domicilio();

            	$prod->__SET('Cod_Estado_dom', $r->Cod_Estado_dom);
            	$prod->__SET('Desc_estado_dom', $r->Desc_estado_dom);

            	$result[] = $prod;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_prod(Estado_domicilio $data)
    {
        try 
        {
            $sql = "UPDATE Estado_domicilio SET 
                        Cod_Estado_dom             = ?,
                        Desc_estado_dom      = ? 
                        
                    WHERE Cod_Estado_dom =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_Estado_dom2'), 
                    $data->__GET('Desc_estado_dom'), 
                    $data->__GET('Cod_Estado_dom')
                    
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
                      ->prepare("DELETE FROM Estado_domicilio WHERE Cod_Estado_dom = ?");                      

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
                      ->prepare("SELECT * FROM Estado_domicilio WHERE Cod_Estado_dom = ?");
                      

            $stm->execute(array($prod));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $prod = new Estado_domicilio();


               $prod->__SET('Cod_Estado_dom', $r->Cod_Estado_dom);
               $prod->__SET('Desc_estado_dom', $r->Desc_estado_dom);

            return $prod;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>