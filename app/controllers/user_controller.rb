class UserController < ApplicationController
	def show_owned
		if user_signed_in?
  			@projects = current_user.created
  		end
  	end

  	def show_funded
		if user_signed_in?
  			@projects = current_user.backed
  		end
  	end
	def show_profile
		if user_signed_in?
			@user = current_user
		end
	end
end
