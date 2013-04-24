class Item < ActiveRecord::Base
  attr_accessible :altura, :comprimento, :descricao, :quantidade, :sub_total
end
