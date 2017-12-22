<?php

class Tipo_producto
{
	private $Cod_tipo_prod;
	private $Cod_tipo_prod2;
	private $Desc_tipo_prod;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>