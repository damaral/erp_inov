class Os < ActiveRecord::Base
  attr_accessible :arquivo, :data_entrega, :desconto, :esta_pago, :estado, :observacao, :prioridade, :valor_restante, :valor_total
end
