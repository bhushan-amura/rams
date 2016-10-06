class UserController < ApplicationController

  def switch
    if( current_user.is? :admin )
 		  redirect_to( admins_path )
 	  elsif ( current_user.is? :candidate )
 		  @candidate = Candidate.find_by(user_id:current_user.id)
 		  @candidate.nil?? redirect_to(new_candidate_path) : redirect_to(home_candidate_path(@candidate))
 	  else 
 		  @company = Company.find_by(user_id:current_user.id)
 		  @company.nil?? redirect_to(new_company_path) : redirect_to(home_company_path(@company))
    end
  end

end
