class TasksController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_imputation, only: [:index, :new, :edit]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(imputation_id: @imputation.id)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  def search_tasks
    @tasks = Task.all

  end

  # GET /tasks/new
  def new
    @task_statuses = TaskStatus.all
    @task_types = TaskType.all
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task_statuses = TaskStatus.all
    @task_types = TaskType.all
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.imputation_id = @@imputation.id

    respond_to do |format|
      if @task.save
        @tasks = Task.where(imputation_id: @task.imputation_id)

        format.html { redirect_to imputation_tasks_path(@task.imputation_id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        @tasks = Task.where(imputation_id: @task.imputation_id)

        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @task = Task.find(params[:task_id])
  end




  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    @tasks = Task.where(imputation_id: @task.imputation_id)

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_imputation
    @imputation ||= Imputation.find(params[:id])
    @@imputation = @imputation
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :start_date, :end_date, :task_status_id, :task_type_id, :closing_date)
    end
end
