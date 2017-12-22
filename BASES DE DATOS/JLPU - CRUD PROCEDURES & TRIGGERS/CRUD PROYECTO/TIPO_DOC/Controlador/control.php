<?php

class Tipo_doc
{
	private $Cod_tipo_doc;
	private $Cod_tipo_doc2;
	private $Descripcion_tipo_doc;

	public function __GET($k){ return $this->$k; }
    public function __SET($k, $v){ return $this->$k = $v; }
}

?>