class Empresa < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :cnpj, :complemento, :endereco, :estado, :nome, :nome_fantasia, :observacao, :telefone

  has_many :clientes

  validates :nome, :presence => true
  validates :nome_fantasia, :presence => true
  validates :cnpj, :presence => true
  validates :telefone, :presence => true
end
