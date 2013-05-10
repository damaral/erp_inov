class Acao < ActiveRecord::Base
  attr_accessible :acao, :comentario, :os_id, :funcionario_id, :cliente_id

  belongs_to :funcionario
  belongs_to :cliente
  belongs_to :os

  APROVAR_EXECUCAO = "aprovar_execucao"
  APROVAR_LAYOUT = "aprovar_layout"
  REPROVAR_LAYOUT = "reprovar_layout"
  FINALIZAR_OS = "finalizar_os"
  ENTREGAR_OS = "entregar_os"
end
