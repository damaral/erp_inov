# coding: utf-8

class Os < ActiveRecord::Base
  attr_accessible :arquivo, :data_entrega, :previsao_entrega, :desconto, :esta_pago, :estado, :observacao, :aprovado_por, :cliente_id, :itens_attributes, :pagamentos_attributes

  has_many :itens, :dependent => :destroy
  has_many :pagamentos
  has_many :acoes
  belongs_to :cliente

  accepts_nested_attributes_for :itens, :allow_destroy => true, :reject_if => proc { |attributes| attributes['produto_id'].blank? }
  accepts_nested_attributes_for :pagamentos, :reject_if => proc { |attributes| attributes['valor'].blank? }

  after_create :verifica_se_esta_pago

  ESTADO_0 = 0
  ESTADO_1 = 1
  ESTADO_2 = 2
  ESTADO_3 = 3
  ESTADO_4 = 4
  ESTADO_5 = 5
  ESTADO_6 = 6

  ESTADOS = {ESTADO_0 => "Aguardando aprovação ou sinal",
             ESTADO_1 => "Layout em desenvolvimento",
             ESTADO_2 => "Aguardando aprovação do Layout",
             ESTADO_3 => "Em execução",
             ESTADO_4 => "Em processo de Finalização",
             ESTADO_5 => "Finalizado",
             ESTADO_6 => "Entregue"}

  CLIENTE = "Cliente"
  GERENCIA = "Gerência"

  APROVADORES = [CLIENTE, GERENCIA]

  validates :desconto, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :cliente, :presence => true

  def valor_total
    total = itens.inject(0) {|sum, item| sum + item.subtotal}
    total - desconto
  end

  def valor_pago
    pagamentos.inject(0) {|sum, pagamento| sum + pagamento.valor}
  end

  def valor_restante
    valor_total - valor_pago
  end

  private
  def verifica_se_esta_pago
    if self.valor_restante == 0
      self.esta_pago = true
    else
      self.esta_pago = false
    end
    self.save
  end
end
