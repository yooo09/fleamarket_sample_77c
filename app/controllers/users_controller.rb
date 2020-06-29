class UsersController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def logout

  end

  def destroy
    @users = User.find(params[:id])
    redirect_to root_path
  end

end

