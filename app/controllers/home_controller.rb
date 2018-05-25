class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		if current_user.user_type == "generic"
  			@created_projects = current_user.created
  		end
  	end
  end
end
