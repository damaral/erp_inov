class Empresa < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :cnpj, :complemento, :endereco, :estado, :nome, :nome_fantasia, :observacao, :telefone

  has_many :clientes, :dependent => :destroy

  scope :by_nome, -> nome { where("nome like '%#{nome}%'") }
  scope :by_nome_fantasia, -> nome_fantasia { where("nome_fantasia like '%#{nome_fantasia}%'") }

  validates :nome, :presence => true
  validates :nome_fantasia, :presence => true
  validates :cnpj, :presence => true
  validates :telefone, :presence => true
end
