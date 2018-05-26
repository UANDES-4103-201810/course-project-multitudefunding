class AdminController < ApplicationController
  def admin_categories
    @categories = Category.all
  end
  def admin_users
    @users = User.all
  end
end
