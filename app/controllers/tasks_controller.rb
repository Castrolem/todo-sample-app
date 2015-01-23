class TasksController < ApplicationController

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "task created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
