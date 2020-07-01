class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  def index
    @likes = Like.where(user_id: current_user.id)
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


