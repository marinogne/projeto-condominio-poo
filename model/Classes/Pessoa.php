<?php

class Pessoa{
    protected $nome;
    protected $cpf;
    protected $dataNascimento;

}

public function __construct($nome, $cpf, $dataNascimento){
    $this-> setNome($nome);
    $this-> setCpf($cpf);
    $this-> setDataNascimento($dataNascimento);
}

public function getNome(){
    return $this->nome;
}
public function setNome($nome){
    $this->nome = $nome;

    return $this;
}

public function getCpf(){
    return $this->cpf;
}
public function setCpf($cpf){
    $this->cpf = $cpf;

    return $this;
}

public function getDataNascimento(){
    return $this->dataNascimento;
}
public function setDataNascimento($dataNascimento){
    $this->dataNascimento = $dataNascimento;

    return $this;
}


