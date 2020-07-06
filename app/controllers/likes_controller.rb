class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  before_action :set_category, only: :index
  
  def index
    @likes = Like.where(user_id: current_user.id).order("created_at DESC")
    @items = []
    @likes.each do |like|
      item_id = like.item_id
      @items << Item.find(item_id)
    end
  end

  def create
    @likes = Like.new(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @likes.save
  end

  def destroy
    @likes = Like.find_by(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @likes.destroy
  end


  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end


