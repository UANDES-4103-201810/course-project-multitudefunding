class UsersController < ApplicationController
	def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :nickname, :phone_number )
  end
end
