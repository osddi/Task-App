class TasksController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def show
  end
  
  private
    
    def task_params
      params.require(:task).permit(:name, :detail)
    end
end
