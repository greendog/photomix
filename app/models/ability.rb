class Ability
  include CanCan::Ability

  def initialize(user)
    self.clear_aliased_actions

    alias_action :edit, :to => :update
    alias_action :new, :to => :create
    alias_action :new_action, :to => :create
    alias_action :show, :to => :read

    if user.has_role? 'admin'
      can :manage, :all
    else
      #############################
      can :read, User do |resource|
        resource == user
      end
      can :update, User do |resource|
        resource == user
      end
      can :create, User
      ##############################
      can :read, Profile do |resource|
        resource == user
      end
      can :update, Profile do |resource|
        resource == user
      end
      can :create, Profile
      ###############################
      can :read, Link do |resource|
        resource == user
      end
      can :update, Link do |resource|
        resource == user
      end
      can :create, Link
     end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
