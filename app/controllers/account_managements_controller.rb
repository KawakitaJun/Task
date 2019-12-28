class AccountManagementsController < ApplicationController
  def index
    @users = User.all
    @new_user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash = {success: 'ユーザーが作成されました。'}
    else
      flash = {error: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash = {success: 'ユーザーが削除されました。'}
    else
      flash = {error: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash = {success: 'ユーザー情報が更新されました。'}
    else
      flash = {error: '更新に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def user_params
    params.require(:user).permit(:name, :email, :department_id, :authoriy, :password)
  end
end
