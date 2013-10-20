class Ability
  include CanCan::Ability

  def initialize(user)
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
    
    cannot :manual, "Stop"

    can :read, :all, :room_id => user.room_id
    can :read, Notification, :user_id => user.id
    can :update, Notification, :user_id => user.id
    can :create, :all
    can :destroy, :all, :user_id => user.id
    cannot :destroy, Room
    cannot :create, User
    can :update, CheckList, :room_id => user.room_id
    can :update, ChoreList, :room_id => user.room_id
    cannot :update, PollList
    can :update, Bill, :room_id => user.room_id
    can :update, CheckListItem, :room_id => user.room_id
    can :update, ChoreListItem, :room_id => user.room_id
    can :update, ChoreListRecurringItem, :room_id => user.room_id
    can :update, Note, :user_id => user.id
    can :update, PollListItem, :room_id => user.room_id

    if user.room_id
      cannot :create, Room
      cannot :new, Room
    end
  end
end
