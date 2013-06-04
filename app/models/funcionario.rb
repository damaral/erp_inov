# coding: utf-8

class Funcionario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bairro, :cargo, :celular, :cep, :cidade, :complemento, :data_admissao, :data_demissao, :endereco, :estado, :nome, :rg, :sobrenome, :telefone

  has_many :acoes, :dependent => :destroy

  validates :nome, :presence => true
  validates :sobrenome, :presence => true
  validates :telefone, :presence => true
  validates :data_admissao, :presence => true
  #validates_format_of :email, :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :message => "Formato inválido", :if => :email_not_blank?

  #def email_not_blank?
  #  !email.blank?
  #end
end
