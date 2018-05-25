class UserController < ApplicationController
	def show_owned
		if user_signed_in?
  			@projects = current_user.created
  		end
  	end
end
