class UserController < ApplicationController
 before_filter :authenticate_user!

 def index
    @user = current_user.info.class
 	if( @user == Admin )
 		redirect_to( admins_path )
 	elsif ( @user == Candidate )
 		@candidate = Candidate.find_by(user_id:current_user.id)
 		redirect_to( candidate_path(@candidate) )
 	else
 		@company = Company.find_by(user_id:current_user.id)
 		redirect_to( company_path(@company) )
 	end
 end

 # def destroy
 #    current_user.destroy
 #    respond_to do |format|
 #      format.html { redirect_to new_user_session_path, notice: 'user was successfully logged out.' }
 #      format.json { head :no_content }
 #    end
 # end

end
