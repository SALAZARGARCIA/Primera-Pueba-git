<?php

class Forma_pago
{
	private $Cod_Forma_pago;
	private $Cod_Forma_pago2;
	private $Desc_fpago;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>