# coding: utf-8

class Os < ActiveRecord::Base
  attr_accessible :arquivo, :data_entrega, :desconto, :esta_pago, :estado, :observacao, :prioridade, :valor_restante, :valor_total, :cliente_id, :itens_attributes

  has_many :itens, :dependent => :destroy
  has_many :pagamentos
  has_many :acoes
  belongs_to :cliente

  accepts_nested_attributes_for :itens, :allow_destroy => true

  URGENTE = "Urgente"
  ALTA = "Alta"
  NORMAL = "Normal"
  BAIXA = "Baixa"
  MINIMA = "Mínima"
  
  PRIORIDADES = [URGENTE,
                 ALTA,
                 NORMAL,
                 BAIXA,
                 MINIMA]

  validates :valor_total, :presence => true, :numericality => {:greater_than => 0}
  validates :desconto, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :valor_restante, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end
