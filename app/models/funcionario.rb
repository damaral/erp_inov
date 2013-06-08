# coding: utf-8

class Funcionario < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bairro, :cargo, :celular, :cep, :cidade, :complemento, :data_admissao, :data_demissao, :endereco, :estado, :nome, :rg, :sobrenome, :telefone
  attr_accessible :roles_mask

  roles_attribute :roles_mask

  roles :administrador, :gerente, :atendente, :singmaker

  has_many :acoes, :dependent => :destroy

  validates :nome, :presence => true
  validates :sobrenome, :presence => true
  validates :telefone, :presence => true
  validates :data_admissao, :presence => true
  validates :roles_mask, :presence => true

end
