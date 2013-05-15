# coding: utf-8

class Item < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :desconto, :descricao, :quantidade, :tipo, :produto_id, :os_id

  belongs_to :produto
  belongs_to :os

  before_create :ajusta_dimensoes

  RECORTE = "Recorte"
  IMPRESSAO = "Impressão Digital"
  RECORTE_E_IMPRESSAO = "Recorte e Impressão Digital"

  TIPOS = [IMPRESSAO,
           RECORTE,
           RECORTE_E_IMPRESSAO]

  validates :altura, :presence => true, :numericality => {:greater_than => 0}
  validates :comprimento, :presence => true, :numericality => {:greater_than => 0}
  validates :quantidade, :presence => true, :numericality => {:greater_than => 0}
  validates :produto, :presence => true
  validates :desconto, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  #validates :os, :presence => true

  def subtotal
    if produto.unidade == Produto::PECA
      quantidade*produto.preco_unitario
    elsif produto.unidade == Produto::METRO_COMP
      quantidade*(comprimento/100)*produto.preco_unitario
    elsif produto.unidade == Produto::METRO_ALT
      quantidade*(altura/100)*produto.preco_unitario
    elsif produto.unidade == Produto::PECAMETRO_QUADRADO
      quantidade*(altura/100)*(comprimento/100)*produto.preco_unitario
    end
  end

  def subtotal_com_desconto
    subtotal - desconto
  end

  def valor_unitario
    if produto.unidade == Produto::PECA
      produto.preco_unitario
    elsif produto.unidade == Produto::METRO_COMP
      (comprimento/100)*produto.preco_unitario
    elsif produto.unidade == Produto::METRO_ALT
      (altura/100)*produto.preco_unitario
    elsif produto.unidade == Produto::PECAMETRO_QUADRADO
      (altura/100)*(comprimento/100)*produto.preco_unitario
    end
  end

  private
  def ajusta_dimensoes
    #self.altura = self.altura / 100
    #self.comprimento = self.comprimento / 100

    self.altura = self.produto.altura if self.produto.unidade == Produto::PECA || self.produto.unidade == Produto::METRO_COMP
    self.comprimento = self.produto.comprimento if self.produto.unidade == Produto::PECA || self.produto.unidade == Produto::METRO_ALT
  end
end
