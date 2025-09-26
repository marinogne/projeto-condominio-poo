<?php

include_once '...\model\classes\pessoa';

class PrestadorServico extends Pessoa{
    protected $idPrestadorServico;
    protected $funcao;

    public function __construc($nome, $cpf, $dataNascimento, $idPrestadorServico, $funcao){
    parent::__construct($nome, $cpf, $dataNascimento);
    $this->setIdPrestadorServico($idPrestadorServico);
    }

    public function getIdPrestadorServico(){
        return $this->idPrestadorServico;
    }
    public function setIdPrestadorServico($idPrestadorServico){
        $this->isPrestadorServico = $idPrestadorServico;

        return $this;
    }

    public function getFuncao(){
        return $this->funcao;
    }
    public function setFuncao($funcao){
        $this->funcao = $funcao;

        return $this;
    }
}
