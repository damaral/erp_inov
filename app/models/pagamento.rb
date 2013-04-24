class Pagamento < ActiveRecord::Base
  attr_accessible :forma_de_pagamento, :tipo, :valor
end
