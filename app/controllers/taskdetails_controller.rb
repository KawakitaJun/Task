class TaskdetailsController < ApplicationController
  def index
  end

  def create
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash = {success: 'タスク詳細が更新されました。'}
    else
      flash = {error: '更新に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def edit
    @task= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :user_id, :category_id, :client_id, :status_id, :duedate, :content)
  end
end
