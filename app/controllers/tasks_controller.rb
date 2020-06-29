class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def new
  end
  
  def show
  end
end
