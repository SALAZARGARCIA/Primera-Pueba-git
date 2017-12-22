<?php
class docModel
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
		

	public function Registrar_doc(Tipo_doc $data)
	{
		try
		{
			$sql = "INSERT INTO Tipo_doc (Cod_tipo_doc, Descripcion_tipo_doc) VALUES (?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_tipo_doc'),
					$data->__GET('Descripcion_tipo_doc')
					)
				);
		} catch (Exeption $e)
		{
			die($e->getMessage());
		}
	}

	 public function Listar_doc()
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM Tipo_doc");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$doc = new Tipo_doc();

            	$doc->__SET('Cod_tipo_doc', $r->Cod_tipo_doc);
            	$doc->__SET('Descripcion_tipo_doc', $r->Descripcion_tipo_doc);

            	$result[] = $doc;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_doc(Tipo_doc $data)
    {
        try 
        {
            $sql = "UPDATE Tipo_doc SET 
                        Cod_tipo_doc             = ?,
                        Descripcion_tipo_doc      = ? 
                        
                    WHERE Cod_tipo_doc =?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_tipo_doc2'), 
                    $data->__GET('Descripcion_tipo_doc'), 
                    $data->__GET('Cod_tipo_doc')
                    
                    )
                );
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


    public function Eliminar_doc($doc)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("DELETE FROM Tipo_doc WHERE Cod_tipo_doc = ?");                      

            $stm->execute(array($doc));
        } catch (Exception $e) 
        {
            die($e->getMessage());
        }
    }


  public function Obtener_doc($doc)
    {
        try 
        {
            $stm = $this->pdo
                      ->prepare("SELECT * FROM Tipo_doc WHERE Cod_tipo_doc = ?");
                      

            $stm->execute(array($doc));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $doc = new Tipo_doc();


               $doc->__SET('Cod_tipo_doc', $r->Cod_tipo_doc);
               $doc->__SET('Descripcion_tipo_doc', $r->Descripcion_tipo_doc);

            return $doc;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>