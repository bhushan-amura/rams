class Ability
  include CanCan::Ability

  def initialize(user)
    if !user.nil?
      if user.is? :candidate
        can :manage, Candidate, user_id: user.id
        can :manage, Candidate::Achievement, :candidate => {:user_id => user.id}
        can :manage, Candidate::Project, :candidate => {:user_id => user.id}
        can :manage, Candidate::Experience, :candidate => {:user_id => user.id}
        can :manage, Candidate::Link, :candidate => {:user_id => user.id}
        can :manage, Candidate::Reference, :candidate => {:user_id => user.id}
        can :read, Company
      elsif user.is? :company
        can :manage, Company, user_id: user.id
        can :manage, Company::JobOpportunity, :company => {:user_id => user.id}
        can :resume, Candidate
      end
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
