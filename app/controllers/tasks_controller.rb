class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
    @new_task = Task.new
    @q = Task.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash = {success: 'タスクが作成されました。'}
    else
      flash = {error: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      flash = {success: 'タスクが削除されました。'}
    else
      flash = {error: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash = {success: 'タスク内容が更新されました。'}
    else
      flash = {error: '更新に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def task_params
    params.require(:task).permit(:name, :user_id, :category_id, :client_id, :status_id, :duedate)
  end
end