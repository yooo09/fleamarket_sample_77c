class UsersController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
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

