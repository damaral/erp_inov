# coding: utf-8

class Pagamento < ActiveRecord::Base
  attr_accessible :forma_de_pagamento, :valor, :cliente_id, :os_id

  belongs_to :cliente
  belongs_to :os

  DINHEIRO = "Dinheiro"
  CHEQUE = "Cheque"
  DEBITO = "Débito"
  CREDITO = "Crédito"
  BOLETO = "Boleto"

  FORMAS_PGTO = [DINHEIRO,
                 CHEQUE,
                 DEBITO,
                 CREDITO,
                 BOLETO]

  validates :valor, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

end
