# coding:utf-8

class Fatura < ActiveRecord::Base
  attr_accessible :data_prevista, :data_realizada, :descricao, :esta_pago, :multa, :valor, :funcionario_id, :fornecedor_id

  belongs_to :funcionario
  belongs_to :fornecedor

  before_save :set_data_realizada

  validates :valor, :presence => true, :numericality => {:greater_than => 0}
  validates :multa, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :data_prevista, :presence => true
  validate :valida_destinatario

  def valida_destinatario
  	if funcionario_id.nil? && fornecedor_id.nil?
  		errors.add(:funcionario, "O funcionário ou o fornecedor deve ser preenchido")
  		errors.add(:fornecedor, "O funcionário ou o fornecedor deve ser preenchido")
  	end 
  end

  private
  def set_data_realizada
    if self.data_realizada.nil? && self.esta_pago
      self.data_realizada = Date.today
    elsif !self.esta_pago
      self.data_realizada = nil
    end
  end
end