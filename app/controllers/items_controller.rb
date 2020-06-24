class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to item_path
  end

  def confirm
    @item = Item.find(params[:id])
  end
end



