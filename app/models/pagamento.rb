# coding: utf-8

class Pagamento < ActiveRecord::Base
  attr_accessible :forma_de_pagamento, :valor, :esta_pago, :data_prevista, :cliente_id, :os_id

  belongs_to :cliente
  belongs_to :os

  before_save :link_cliente
  before_save :verifica_esta_pago
  before_create :verifica_esta_pago
  before_validation :valida_valor
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

  validates :valor, :presence => true, :numericality => {:greater_than => 0}
  validates :data_prevista, :presence => true
  validates :os_id, :presence => true

  def valor_pago
    esta_pago ? valor : 0
  end

  private
  def link_cliente
    self.cliente_id = (Os.find self.os_id).cliente.id
  end

  def verifica_esta_pago
    self.esta_pago = true if self.forma_de_pagamento == DINHEIRO
  end

  def atualiza_esta_pago_os
    self.os.atualiza_esta_pago
  end

  def valida_valor
    os_pagamento = Os.find self.os_id
    if !self.persisted? && !(os_pagamento.valor_restante_pagamentos >= self.valor)
      errors.add(:valor, "O valor deve ser inferior ou igual ao restante (R$ #{self.os.valor_restante_pagamentos.round 2})")
    elsif self.persisted? && !((os_pagamento.valor_restante_pagamentos + (Pagamento.find self.id).valor) >= self.valor)
      errors.add(:valor, "O valor deve ser inferior ou igual ao restante (R$ #{(os_pagamento.valor_restante_pagamentos + (Pagamento.find self.id).valor).round 2})")
    end
  end
end
