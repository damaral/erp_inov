# coding: utf-8

class Produto < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :custo_unitario, :descricao, :nome, :preco_unitario, :unidade

  has_many :itens

  PECA = "Peça"
  METRO_COMP = "Metro Comprimento"
  METRO_ALT = "Metro Altura"
  METRO_QUADRADO = "Metro Quadrado"

  UNIDADES = [PECA,
              METRO_COMP,
              METRO_ALT,
              METRO_QUADRADO]

  validates :nome, :presence => true
  validates :custo_unitario, :presence => true, :numericality => {:greater_than => 0}
  validates :preco_unitario, :presence => true, :numericality => {:greater_than => 0}
  validate :valida_unidade

  def valida_unidade
    errors.add(:unidade, "Unidade inválida") unless UNIDADES.include? unidade
  end

end
