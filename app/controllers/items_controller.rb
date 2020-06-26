class ItemsController < ApplicationController
  
  # before_action :set_item, except: [:index, :new, :search]
  # before_action :move_to_index, except: [:index, :show, :search]
  def index
    @items = Item.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def search
    return nil if params[:keyword] == ""
    @items = Item.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # private
  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
