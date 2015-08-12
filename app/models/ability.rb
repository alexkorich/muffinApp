class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.role==="admin"
        can :access, :rails_admin   # grant access to rails_admin
        can :dashboard 
        # can :create, Menu, date:Date.today
        can :read, Menu
        can :delete, Menu
        can :update, Menu
        can :manage, Dish
        can :manage, Order
        can :manage, User
        can :manage, :all
        
      elsif user.role==="customer"
        can :read, Menu
        can :find_by_date, Menu
        can :create_from_menu, Order
        can :read, Order, user_id: user.id
        can :create, Order
      else

      end
    
             # grant access to the dashboard
    
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
