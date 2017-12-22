<?php

class Estado_domicilio
{
	private $Cod_Estado_dom;
	private $Cod_Estado_dom2;
	private $Desc_estado_dom;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>