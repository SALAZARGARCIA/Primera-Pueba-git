<?php

class Pizzeria
{
	private $Nit_Pizzeria;	
	private $Nit_Pizzeria2;
	private $Nom_Pizzeria;
	private $Dir_Pizzeria;
	private $Tel_Pizzeria;
	private $Cel_Pizzeria;
	private $Logo_Pizzeria;	
	

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>