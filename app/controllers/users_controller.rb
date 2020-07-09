class UsersController < ApplicationController
  before_action :set_category

  def show
    @user = User.find(params[:id])
    @item = Item.where(user_id: current_user.id)
    @items = Item.where(buyer_id: current_user.id)
    @users = @user.items.order("created_at DESC")
    @adress = Adress.find_by(user_id_id: params[:id])
    if @user.id != current_user.id
      redirect_to root_path
    end
  end

  def logout
  end

  def destroy
    @users = User.find(params[:id])
    redirect_to root_path
  end
end

