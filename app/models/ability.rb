class Ability
  include CanCan::Ability

  def initialize(funcionario)
    # Define abilities for the passed in user here. For example:
    #
    funcionario ||= Funcionario.new # guest user (not logged in)

    if funcionario.has_role? :administrador
      can :manage, :all
    elsif funcionario.has_role? :gerente
      can :manage, :all
      cannot :destroy, Funcionario
      cannot [:destroy, :update], Acao
      cannot :destroy, Produto
    elsif funcionario.has_role? :atendente
      can :manage, :all
      cannot [:create, :update, :destroy], Funcionario
      cannot :destroy, Cliente
      cannot :destroy, Empresa
      cannot [:destroy, :update], Acao
      cannot [:create, :destroy, :update], Produto
      #cannot :acao, Os
    elsif funcionario.has_role? :signmaker
      can [:acao, :anexar], Os
      can :read, :all
      cannot :read, Pagamento
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
