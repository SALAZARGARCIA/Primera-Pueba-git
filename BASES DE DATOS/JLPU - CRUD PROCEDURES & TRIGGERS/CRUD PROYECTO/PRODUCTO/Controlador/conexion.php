<?php 

class database {


	public static function conectar(){

		try {
			$pdo = new PDO('mysql:host=localhost;dbname=sidpla', 'root', '');
			$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
			return $pdo;
		} catch(Exception $e){
			die($e->getMessage());
		}
	}
}
?>