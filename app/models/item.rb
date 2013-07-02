# coding: utf-8

class Item < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :desconto, :descricao, :quantidade, :tipo, :produto_id, :os_id, :valor_unitario

  belongs_to :produto
  belongs_to :os

  before_save :ajusta_dimensoes
  before_save :set_valor_unitario
  before_create :ajusta_dimensoes
  after_save :atualiza_esta_pago_os
  after_create :atualiza_esta_pago_os
  after_destroy :atualiza_esta_pago_os

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
  validates :tipo, :presence => true
  validates :desconto, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  #validates :os, :presence => true

  
  #def subtotal
  #  if produto.unidade == Produto::PECA
  #    quantidade*produto.preco_unitario
  #  elsif produto.unidade == Produto::METRO_COMP
  #    quantidade*(comprimento/100)*produto.preco_unitario
  #  elsif produto.unidade == Produto::METRO_ALT
  #    quantidade*(altura/100)*produto.preco_unitario
  #  elsif produto.unidade == Produto::PECAMETRO_QUADRADO
  #    quantidade*(altura/100)*(comprimento/100)*produto.preco_unitario
  #  end
  #end

  def subtotal_com_desconto
    subtotal - desconto
  end

  #def valor_unitario
  #  if produto.unidade == Produto::PECA
  #    produto.preco_unitario
  #  elsif produto.unidade == Produto::METRO_COMP
  #    (comprimento/100)*produto.preco_unitario
  #  elsif produto.unidade == Produto::METRO_ALT
  #    (altura/100)*produto.preco_unitario
  #  elsif produto.unidade == Produto::PECAMETRO_QUADRADO
  #    (altura/100)*(comprimento/100)*produto.preco_unitario
  #  end
  #end

  def subtotal
    valor_unitario*quantidade
  end
  

  private
  def ajusta_dimensoes
    self.altura = self.produto.altura if self.produto.unidade == Produto::PECA || self.produto.unidade == Produto::METRO_COMP
    self.comprimento = self.produto.comprimento if self.produto.unidade == Produto::PECA || self.produto.unidade == Produto::METRO_ALT
  end

  def atualiza_esta_pago_os
    self.os.atualiza_esta_pago
  end

  def set_valor_unitario
    if self.produto.unidade == Produto::PECA
      self.valor_unitario = self.produto.preco_unitario
    elsif self.produto.unidade == Produto::METRO_COMP
      self.valor_unitario = (comprimento/100)*self.produto.preco_unitario
    elsif self.produto.unidade == Produto::METRO_ALT
      self.valor_unitario = (altura/100)*self.produto.preco_unitario
    elsif self.produto.unidade == Produto::METRO_QUADRADO
      self.valor_unitario = (altura/100)*(comprimento/100)*self.produto.preco_unitario
    end
  end
end
