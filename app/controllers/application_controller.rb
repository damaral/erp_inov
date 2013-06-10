class ApplicationController < ActionController::Base
  protect_from_forgery

  NUMERO_POR_PAGINA = 10

  def current_ability
    @current_ability ||= Ability.new(current_funcionario)
  end

  #rescue_from CanCan::AccessDenied do |exception|
    #redirect_to root_url, :notice => exception.message
  #end
end
