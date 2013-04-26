class Pagamento < ActiveRecord::Base
  attr_accessible :forma_de_pagamento, :tipo, :valor

  belongs_to :cliente
  belongs_to :os
end
