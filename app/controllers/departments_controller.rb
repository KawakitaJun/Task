class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    @new_department = Department.new
  end

  def create
    @department = Department.new(department_param)
    if @department.save
      flash = {success: '部署が作成されました。'}
    else
      flash = {error: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
   end

  def show
  end

  def destroy
    department = Department.find(params[:id])
    if department.destroy
      flash = {success: '部署が削除されました。'}
    else
      flash = {error: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def edit
  end

  def update
    department = Department.find(params[:id])
    if department.update(department_param)
      flash = {success: '部署名が更新されました。'}
    else
      flash = {error: '更新に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end


  def department_param
    params.require(:department).permit(:name)
  end
end
