class AdressesController < ApplicationController
  before_action :set_category
  before_action :user_params, only: [:new, :edit ]

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
    @adress = Adress.find(params[:id])
  end

  def update
    @adress = Adress.find(params[:id])
    if @adress.update(adress_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private
  def adress_params
    params.require(:adress).permit(:zip_code, :prefecture, :city, :house_number, :building, :phone_number).merge(user_id_id: current_user.id)
  end

  def user_params
    @user = User.find_by(params[:id])
  end
end
