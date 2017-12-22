<?php

class Rol
{
	private $Rol;
	private $Rol2;
	private $estado_rol;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>