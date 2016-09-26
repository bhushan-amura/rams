class UserController < ApplicationController
 # before_filter :authenticate_user!

 def index
    @user = current_user.info.class
 	if( @user == Admin )
 		redirect_to( admins_path )
 	elsif ( @user == Candidate )
 		redirect_to( candidates_path )
 	else
 		redirect_to( companies_path )
 	end
 end
 
end