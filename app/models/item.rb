class Item < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :descricao, :quantidade, :sub_total, :produto_id, :os_id

  belongs_to :produto
  belongs_to :os

  validates :altura, :presence => true, :numericality => {:greater_than => 0}
  validates :comprimento, :presence => true, :numericality => {:greater_than => 0}
  validates :quantidade, :presence => true, :numericality => {:greater_than => 0}
  validates :sub_total, :presence => true, :numericality => {:greater_than => 0}
  validates :produto, :presence => true
  #validates :os, :presence => true
end
