class TasksController < ApplicationController
  before_action :set_user, only: [:index, :create, :edit, :update, :show]
  before_action :set_task, only: [:edit, :update, :show, :destroy]
  before_action :logged_in_user
  before_action :correct_user
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
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
      redirect_to user_task_url(@user)
    else
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url
  end
  
  private
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_task
      @task = Task.find(params[:id])
    end
    
    def task_params
      params.require(:task).permit(:name, :detail)
    end
end
