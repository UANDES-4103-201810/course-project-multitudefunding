class ProjectController < ApplicationController
  def show_project
    @projects = Project.all
  end
end
