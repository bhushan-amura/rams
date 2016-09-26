class UserController < ApplicationController
 before_filter :authenticate_user!

 def index
    @whichuser = current_user.admin||current_user.candidate||current_user.company
    @whichuser = @whichuser.class
 	if(@whichuser == Admin)
 		@useris = @whichuser
 	elsif @whichuser == Candidate
 		@useris = @whichuser
 		redirect_to(:controller => 'company', :action => 'index')
 	else
 		@useris = @whichuser
 		redirect_to(:controller => 'company', :action => 'index')
 	end
 end
end