class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role == "admin"
      can :manage, :all
    else
      can :read, ArticleCategory
      can :manage, Article, :user_id =>user.id
    end

  end
end
