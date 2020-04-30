class CategoriesController < ApplicationController
  def index
    @categories = Category.find_by(user_id: current_user.id)
    @new_category = Category.new

    @clients = Client.find_by(user_id: current_user.id)
    @new_client = Client.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash = {success: 'カテゴリーが作成されました。'}
    else
      flash = {error: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def clientcreate
    @client = Client.new(client_params)
    if @client.save
      flash = {clientsuccess: '依頼元が作成されました。'}
    else
      flash = {clienterror: '作成に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end 

  def destroy
    category = Category.find_by(category_params)
    if category.destroy
      flash = {success: 'カテゴリーが削除されました。'}
    else
      flash = {error: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def clientdestroy
    client = Client.find_by(client_params)
    if client.destroy
      flash = {clientsuccess: '依頼元が削除されました。'}
    else
      flash = {clienterror: '削除に失敗しました。'}
    end
    redirect_to request.referer, flash: flash
  end

  def category_params
    params.require(:category).permit(:id, :name, :user_id)
  end

  def client_params
    params.require(:client).permit(:id, :name, :user_id)
  end
end
