class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def purchase
    @user = User.find(params[:id])
    @credit_card = CreditCard.find(params[:id])
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:condition,:delivery_fee,:shipping_area,:delivery_time,:price,:use_id,:brand_id,:category_id,images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

end