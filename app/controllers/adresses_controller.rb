class AdressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :user_params, only: [:new, :edit ]
  before_action :set_adress, only: [:edit, :update,:destroy, :not_currect_user]
  before_action :not_currect_user, only: [:edit, :update, :destroy]
  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @adress.update(adress_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @adress.destroy
    redirect_to root_path
  end

  private
  def adress_params
    params.require(:adress).permit(:zip_code, :prefecture, :city, :house_number, :building, :phone_number).merge(user_id_id: current_user.id)
  end

  def set_adress
    @adress = Adress.find(params[:id])
  end

  def user_params
    @user = User.find_by(params[:id])
  end

  def not_currect_user
    redirect_to root_path if current_user.id != @adress.user_id_id
  end

end
