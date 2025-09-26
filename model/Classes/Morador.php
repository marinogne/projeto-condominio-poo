<?php

include_once '...\model\classes\Pessoa.php';

class Morador extends Pessoa{
    protected $idMorador;
}

public function __construct($nome, $cpf, $dataNascimento, $idMorador){
    parent::__construct($nome, $cpf, $dataNascimento);
    $this->setIdMorador($idMorador);
}

public function getIdMorador(){
    return $this->idMorador;
}
public function setIdMorador($idMorador){
    $this->idMorador = $idMorador;

    return $this;
}