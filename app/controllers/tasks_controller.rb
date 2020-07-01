class TasksController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit]
  before_action :set_task, only: [:edit, :update, :show]
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(name: params[:name], detail: params[:detail], user_id: @user.id)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url([@user, @task])
    else
      render :edit
    end
  end
  
  def show
  end
  
  private
    
    def set_task
      @task = Task.find(params[:id])
    end
    
    def task_params
      params.require(:task).permit(:name, :detail)
    end
end
