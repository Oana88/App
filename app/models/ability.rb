class Ability
  include CanCan::Ability


  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in 
    if
        user ||= User.new #guest user (not logged in)
        can :manage, User, id: user.id
    else
        user.admin?
        can :manage, :all 
    end
   end

end
    
