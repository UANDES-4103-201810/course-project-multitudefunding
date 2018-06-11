class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    is_creator = false
    if @project.creators.include?(current_user)
      is_creator = true
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    unless @project.creators.include?(current_user)
      redirect_to @project
    end
  end

  def fund
    #ProjectBacker.new()
  end

  # POST /projects
  # POST /projects.json
  def create
    if user_signed_in?
      @project = Project.new(project_create_params)
      respond_to do |format|
        if @project.save
          @project_creator = ProjectCreator.new(:user_id => current_user.id, :project_id =>@project.id, :owner => true)
          @project_creator.save
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.creators.include?(current_user)
      respond_to do |format|
        if @project.update(project_update_params)
          format.html { redirect_to @project, notice: 'Project was successfully updated.' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.creators.include?(current_user)
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_create_params
      params.require(:project).permit(:name, :money_goal, :finish_date, :description, :main_image)
    end
    def project_update_params
      params.require(:project).permit(:name, :description, :main_image)
    end
    def project_params
      params.require(:project).permit(:approved_by, :money_goal, :finish_date, :description, :approved, :rating, :founded, :foundation_date, :approval_date, :main_image)
    end
end
