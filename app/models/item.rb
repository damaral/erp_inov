# coding: utf-8

class Item < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :descricao, :quantidade, :tipo, :produto_id, :os_id

  belongs_to :produto
  belongs_to :os

  before_create :ajusta_dimensoes

  RECORTE = "Recorte"
  IMPRESSAO = "Impressão Digital"
  RECORTE_E_IMPRESSAO = "Recorte e Impressão Digital"

  TIPOS = [RECORTE,
           IMPRESSAO,
           RECORTE_E_IMPRESSAO]

  validates :altura, :presence => true, :numericality => {:greater_than => 0}
  validates :comprimento, :presence => true, :numericality => {:greater_than => 0}
  validates :quantidade, :presence => true, :numericality => {:greater_than => 0}
  validates :produto, :presence => true
  #validates :os, :presence => true

  def subtotal
    if produto.unidade == Produto::PECA
      quantidade*produto.preco_unitario
    elsif produto.unidade == Produto::METRO_COMP
      quantidade*comprimento*produto.preco_unitario
    elsif produto.unidade == Produto::METRO_ALT
      quantidade*altura*produto.preco_unitario
    elsif produto.unidade == Produto::PECAMETRO_QUADRADO
      quantidade*altura*comprimento*produto.preco_unitario
    end
  end

  private
  def ajusta_dimensoes
    self.altura = self.altura / 100
    self.comprimento = self.comprimento / 100

    self.altura = self.produto.altura unless self.produto.altura.nil?
    self.comprimento = self.produto.comprimento unless self.produto.comprimento.nil?
  end
end
