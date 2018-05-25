class PromisesController < ApplicationController
  before_action :set_promise, only: [:show, :edit, :update, :destroy]

  # GET /promises
  # GET /promises.json
  def index
    @project = Project.find(params[:project_id]) 
    @promises = @project.promises
  end

  # GET /promises/1
  # GET /promises/1.json
  def show
  end

  # GET /promises/new
  def new
    @project = Project.find(params[:project_id])
    @promise = @project.promises.build
  end

  # GET /promises/1/edit
  def edit
    @project = Project.find(params[:project_id])
  end

  # POST /promises
  # POST /promises.json
  def create
    @project = Project.find(params[:project_id])
    @promise = @project.promises.new(promise_params)
    respond_to do |format|
      if @promise.save
        format.html { redirect_to [@project,@promise], notice: 'Promise was successfully created.' }
        format.json { render :show, status: :created, location: @promise }
      else
        format.html { render :new }
        format.json { render json: [@project,@promise].errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promises/1
  # PATCH/PUT /promises/1.json
  def update
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @promise.update(promise_params)
        format.html { redirect_to [@project,@promise], notice: 'Promise was successfully updated.' }
        format.json { render :show, status: :ok, location: @promise }
      else
        format.html { render :edit }
        format.json { render json: @promise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promises/1
  # DELETE /promises/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @promise.destroy
    respond_to do |format|
      format.html { redirect_to project_promises_url(@project), notice: 'Promise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promise
      @promise = Promise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promise_params
      params.require(:promise).permit(:name, :price, :description)
    end
end
