class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  before_filter :authenticate_user!
  
  private
  def after_sign_in_path_for(resource)
  	if resource.is? :company
  		@company = Company.find_by(user_id:current_user.id)
 		redirect_to( home_company_path( @company ) )
  	elsif resource.is? :candidate
  		@candidate = Candidate.find_by(user_id:current_user.id)
 		redirect_to( candidate_path( @candidate ) )
  	else
  	end
  end
end
