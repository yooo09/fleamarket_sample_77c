class ItemsController < ApplicationController
  def index
    @items = Item.all
    @parents = Category.where(ancestry: nil)
    
  end

  def new
  end

  def edit
  end

  def show
  end
end
