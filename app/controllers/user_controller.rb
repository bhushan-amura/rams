class UserController < ApplicationController
 # before_filter :authenticate_user!

 def index
    @whichuser = current_user.admin||current_user.candidate||current_user.company
    @whichuser = @whichuser.class
 	if(@whichuser == Admin)
 		@useris = @whichuser
 	elsif @whichuser == Candidate
 		@useris = @whichuser
 		redirect_to(candidates_path)
 	else
 		@useris = @whichuser
 		redirect_to(companies_path)
 	end
 end
end