# coding: utf-8

class Acao < ActiveRecord::Base
  attr_accessible :acao, :comentario, :os_id, :funcionario_id, :cliente_id

  belongs_to :funcionario
  belongs_to :cliente
  belongs_to :os

  APROVAR_EXECUCAO = 0
  APROVAR_LAYOUT = 1
  REPROVAR_LAYOUT = 2
  FINALIZAR_OS = 3
  ENTREGAR_OS = 4
  SUBMETER_LAYOUT = 5
  FINALIZAR_EXECUCAO = 6

  ACOES = {
    APROVAR_EXECUCAO => "Aprovar Execução",
    APROVAR_LAYOUT => "Aprovar Layout",
    REPROVAR_LAYOUT => "Reprovar Layout",
    FINALIZAR_OS => "Finalizar O.S.",
    ENTREGAR_OS => "Entregar O.S.",
    SUBMETER_LAYOUT => "Submeter Layout",
    FINALIZAR_EXECUCAO => "Finalizar Execução"
  }
end
