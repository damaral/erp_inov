# coding: utf-8

class Pagamento < ActiveRecord::Base
  attr_accessible :forma_de_pagamento, :valor, :esta_pago, :data_prevista, :cliente_id, :os_id

  belongs_to :cliente
  belongs_to :os

  before_save :verifica_esta_pago
  before_create :verifica_esta_pago
  #before_validation :valida_valor, :unless => :persisted?
  after_save :atualiza_esta_pago_os
  after_create :atualiza_esta_pago_os
  after_destroy :atualiza_esta_pago_os

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
  validates :data_prevista, :presence => true

  def valor_pago
    esta_pago ? valor : 0
  end

  private
  def verifica_esta_pago
    self.esta_pago = true if self.forma_de_pagamento == DINHEIRO
  end

  def atualiza_esta_pago_os
    self.os.atualiza_esta_pago
  end

  def valida_valor
    os_pagamento = Os.find self.os_id
    errors.add(:valor, "O valor superior ao restante (R$ #{self.os.valor_restante_pagamentos})") unless os_pagamento.valor_restante_pagamentos >= self.valor
  end
end
