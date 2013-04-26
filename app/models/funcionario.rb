# coding: utf-8

class Funcionario < ActiveRecord::Base
  attr_accessible :bairro, :cargo, :celular, :cep, :cidade, :complemento, :data_admissao, :data_demissao, :email, :endereco, :estado, :nome, :rg, :sobrenome, :telefone

  has_many :acoes

  validates :nome, :presence => true
  validates :sobrenome, :presence => true
  validates :telefone, :presence => true
  validates :data_admissao, :presence => true
  validates_format_of :email, :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :message => "Formato inválido", :if => :email_not_blank?

  def email_not_blank?
    !email.blank?
  end
end
