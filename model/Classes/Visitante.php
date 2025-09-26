<?php

include_once '...\model\classes\Pessoa.php';

class Visitante extends Pessoa{
    protected $idVisitante;
}

public function __construc($nome, $cpf, $dataNascimento, $idVisitante){
    parent::__construc($nome, $cpf, $dataNascimento);
    $this-> setIdVisitante($idVisitante);
}

public function getIdVisitante(){
    return $this->idVisitante;

}
public function setIdVisitante($idVisitante){
    $this->idVisitante=$idVisitante

    return $this;
}