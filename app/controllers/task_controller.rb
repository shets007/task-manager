class TaskController  < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end
  private

  def task_params
    params.require(:task).permit(:title, :body)
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "You must signin or sing up." unless user_signed_in?
  end
end
