class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group, user: user
    can :manage, Expense, user: user

    can %i[read create], Group
    can %i[read create], Expense
  end
end
