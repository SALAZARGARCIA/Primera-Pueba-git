<?php
class ProdModel
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
		

	public function Registrar_prod(Producto $data)
	{
		try
		{
			$sql = "INSERT INTO Producto (Cod_producto, Nom_prod, Desc_prod, Foto_prod,Tipo_producto, Stok_min, Stok_max, Cantidad_exist) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";
			$this->pdo->prepare($sql)->execute(
				array(
					$data->__GET('Cod_producto'),
					$data->__GET('Nom_prod'),
                    $data->__GET('Desc_prod'),
                    $data->__GET('Foto_prod'),
                    $data->__GET('Tipo_producto'),
                    $data->__GET('Stok_min'),
                    $data->__GET('Stok_max'),
                    $data->__GET('Cantidad_exist')
                    
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

            $stm = $this->pdo->prepare("SELECT * FROM producto");
            $stm->execute();

            foreach($stm->fetchAll(PDO::FETCH_OBJ) as $r)
            {
            	$prod = new Producto();

            	$prod->__SET('Cod_producto',   $r->Cod_producto);
            	$prod->__SET('Nom_prod',       $r->Nom_prod);
                $prod->__SET('Desc_prod',      $r->Desc_prod);
                $prod->__SET('Foto_prod',      $r->Foto_prod);
                $prod->__SET('Tipo_producto',  $r->Tipo_producto);
                $prod->__SET('Stok_min',       $r->Stok_min);
                $prod->__SET('Stok_max',       $r->Stok_max);
                $prod->__SET('Cantidad_exist', $r->Cantidad_exist);


            	$result[] = $prod;
            }

            return $result;
      
        }
        catch(Exeption $e)
        {
        	die($e->getMessage());
        }
     }

    public function Actualizar_prod(Producto $data)
    {
        try 
        {
            $sql = "UPDATE producto SET 
                        Cod_producto     = ?,
                        Nom_prod         = ?, 
                        Desc_prod        = ?,
                        Foto_prod        = ?, 
                        Tipo_producto    = ?,
                        Stok_min         = ?, 
                        Stok_max         = ?,
                        Cantidad_exist   = ? 
                        
                    WHERE Cod_producto = ?";

            $this->pdo->prepare($sql)
                 ->execute(
                array(
                    $data->__GET('Cod_producto2'), 
                    $data->__GET('Nom_prod'),
                    $data->__GET('Desc_prod'), 
                    $data->__GET('Foto_prod'), 
                    $data->__GET('Tipo_producto'), 
                    $data->__GET('Stok_min'), 
                    $data->__GET('Stok_max'), 
                    $data->__GET('Cantidad_exist'),  
                    $data->__GET('Cod_producto')
                    
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
                      ->prepare("DELETE FROM producto WHERE Cod_producto = ?");                      

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
                      ->prepare("SELECT * FROM producto WHERE Cod_producto = ?");
                      

            $stm->execute(array($prod));
            $r = $stm->fetch(PDO::FETCH_OBJ);

            $prod = new Producto();


                $prod->__SET('Cod_producto',    $r->Cod_producto);
                $prod->__SET('Nom_prod',       $r->Nom_prod);
                $prod->__SET('Desc_prod',      $r->Desc_prod);
                $prod->__SET('Foto_prod',      $r->Foto_prod);
                $prod->__SET('Tipo_producto',  $r->Tipo_producto);
                $prod->__SET('Stok_min',       $r->Stok_min);
                $prod->__SET('Stok_max',       $r->Stok_max);
                $prod->__SET('Cantidad_exist', $r->Cantidad_exist);


            return $prod;
         } catch(Exeption $e){
            die($e->getMessage());
         }






}
}
?>