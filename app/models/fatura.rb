# coding:utf-8

class Fatura < ActiveRecord::Base
  attr_accessible :data_prevista, :descricao, :esta_pago, :multa, :valor, :funcionario_id, :fornecedor_id

  belongs_to :funcionario
  belongs_to :fornecedor

  validates :valor, :presence => true, :numericality => {:greater_than => 0}
  validates :multa, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validate :valida_destinatario

  def valida_destinatario
  	if funcionario_id.nil? && fornecedor_id.nil?
  		errors.add(:funcionario, "O funcionário ou o fornecedor deve ser preenchido")
  		errors.add(:fornecedor, "O funcionário ou o fornecedor deve ser preenchido")
  	end 
  end
end