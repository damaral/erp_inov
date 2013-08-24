# coding:utf-8

class Fornecedor < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :cnpj, :complemento, :endereco, :estado, :nome, :observacao, :telefone, :tipo

  has_many :faturas, :dependent => :destroy

  validates :tipo, :presence => true
  validates :nome, :presence => true
  validates :telefone, :presence => true

  GOVERNO = 0
  FINANCEIRO = 1
  SERVICOS = 2
  MATERIA_PRIMA = 3
  BENS = 4

  TIPOS = {GOVERNO => "Governo",
	  			 FINANCEIRO => "Financeiro",
	  			 SERVICOS => "Serviços",
           MATERIA_PRIMA => "Matéria Prima",
           BENS => "Bens"}
end
