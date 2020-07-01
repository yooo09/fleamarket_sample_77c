class ItemsController < ApplicationController

  before_action :set_item, only: [:confirm, :destroy, :show, :edit, :update]
  before_action :deep_search

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

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
  end

  def show
    @items = Item.all
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  def confirm
    if @item.user_id != current_user.id
    redirect_to root_path
    end
  end

  def search
    @items = Item.all.search(params[:search])
    # return nil if params[:keyword] == ""
    # @items = Item.search(params[:keyword])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def deep_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:condition,:delivery_fee,:shipping_area,:delivery_time,:price,:brand_id,:category_id,images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end



