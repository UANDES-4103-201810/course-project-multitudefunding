class AdminController < ApplicationController
  def admin_categories
    @categories = Category.all
  end
  def admin_users
    @users = User.all
  end
  def make_admin
  end
  def show_profile_admin
    @user = User.find(params[:user_id])
  end
end
