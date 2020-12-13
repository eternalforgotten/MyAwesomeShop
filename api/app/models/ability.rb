class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= User.new

    if user&.class == User
      can :manage, User, id: user.id
      can :read, Product
      can :manage, Cart, user_id: user.id
      can :manage, Order, user_id: user.id
    end
  end
end
