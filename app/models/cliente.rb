# coding: utf-8

class Cliente < ActiveRecord::Base
  attr_accessible :apelido, :bairro, :celular, :cep, :cidade, :complemento, :cpf, :email, :endereco, :estado, :nome, :observacao, :rg, :telefone, :empresa_id

  belongs_to :empresa
  has_many :pagamentos

  validates :nome, :presence => true, :uniqueness => true
  validates :telefone, :presence => true
  validates_format_of :email, :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :message => "Formato inválido", :if => :email_not_blank?

  def email_not_blank?
    !email.blank?
  end

end
