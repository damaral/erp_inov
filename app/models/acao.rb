class Acao < ActiveRecord::Base
  attr_accessible :acao

  belongs_to :funcionario
  belongs_to :os
end
