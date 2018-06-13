class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.search(params[:term])
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
    is_creator = false
    if @project.creators.include?(current_user)
      is_creator = true
    end
    @categories = CategoriesProject.find_by( :project_id => @project.id )
  end

  # GET /projects/new
  def new
    @categories = Category.all
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    puts "Hello"
    unless @project.creators.include?(current_user)
      redirect_to @project
    end
  end

  def fund
    @project = Project.find(params['project'])
    @user = User.find(params['user'])
    money = params['money'].to_i
    if money > 0
      if @project.backers.include?(@user)
        @backer = ProjectBacker.find_by_user_id_and_project_id(@user.id, @project.id)
        invested = @backer.amount_invested
        @backer.update(amount_invested: (invested + money))
        @backer.save
        respond_to do |format|
          format.json { render json: {"status" => "Success"}}
        end
      else
        @project_backer = ProjectBacker.new(:project_id => @project.id, :user_id => @user.id, :amount_invested => money)
        @project_backer.save
            respond_to do |format|
              format.json { render json: {"status" => "Success"}}

            end
      end
    else
      respond_to do |format|
        format.json{ render json: {"status" => "Failure"}}
      end
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    if user_signed_in?
      categories = project_create_params[:categories_names]
      @project = Project.new(project_create_params.except(:categories_names))
      respond_to do |format|
        if @project.save
          @project_creator = ProjectCreator.new(:user_id => current_user.id, :project_id =>@project.id, :owner => true)
          @project_creator.save
          categories.each  do |cat_id|
             @category_project = CategoriesProject.new(:project_id => @project.id, :category_id => cat_id)
             @category_project.save()
          end
          format.html { redirect_to @project, notice: 'Project Successfully Created' }
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

  def approve
    @project = Project.find(params[:id])
    if current_user.user_type == "admin"
      @project.update_attributes({approved: true, approved_by: current_user.id, approval_date: Time.now })
      if @project.save
        respond_to do |format|
          format.html { redirect_to @project , notice: 'Project has been approved' }
        end
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
      params.require(:project).permit(:name, :money_goal, :finish_date, :description, :main_image, :categories_names => [])
    end
    def project_update_params
      params.require(:project).permit(:name, :description, :main_image, :approve, :approved_by, :approval_date)
    end
    def project_params
      params.require(:project).permit(:approved_by, :money_goal, :finish_date, :description, :approved, :rating, :founded, :foundation_date, :approval_date, :main_image)
    end
end
