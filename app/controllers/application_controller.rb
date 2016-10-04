class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  before_filter :authenticate_user!
  # , :get_new_messages

  # private

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) ||
  #     if resource.is? :company
  #       @company = Company.find_by(user_id:current_user.id)
  #       home_company_path
  #     elsif resource.is? :candidate
  #       @candidate = Candidate.find_by(user_id:current_user.id)
        
  #     else
  #       super
  #     end
# end


  # def get_new_messages
  #   if !user_signed_in?
  #     redirect_to new_user_session_path
  #   end
  # end

  # def after_sign_in_path_for(resource_or_scope)
  # 	if resource.is? :company
  # 		byebug
  # 		@company = Company.find_by(user_id:current_user.id)

 	# 	# redirect_to( home_company_path( @company ) )
  # 	elsif resource.is? :candidate
  # 		@candidate = Candidate.find_by(user_id:current_user.id)
 	# 	# redirect_to( candidate_path( @candidate ) )
  # 	else
  # 	end
  # end
end
