class AdminController < ApplicationController
  def admin_categories
    @categories = Category.all
  end
  def admin_users
    @users = User.all
  end
  def new_user
    @user = User.new(params)
  end

  def promote
    @admin = User.find(params['user'])
    @user = User.find(params['promoted'])
    if @admin.user_type == 'admin'
    	@user.user_type = 'admin'
    	@user.save
    	respond_to do |format|
          format.json { render json: {"status" => "Success"}}
        end
    else
    	respond_to do |format|
          format.json { render json: {"status" => "Failure"}}
        end
    end
   end
end
