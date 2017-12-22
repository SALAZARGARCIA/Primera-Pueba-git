<?php

class Rol
{
	private $Cod_rol;
	private $Cod_rol2;
	private $Desc_rol;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>