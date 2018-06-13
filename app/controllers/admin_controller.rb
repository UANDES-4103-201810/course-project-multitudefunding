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
end
