class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :set_array, only: [:index, :show]
  
  def index
    @parents = Category.where(ancestry: nil)
  end


  def show
    @items = @category.set_items
    @items = @items.where(customer_id: nil).order("created_at DESC")
  end


  private

  def set_category
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end

  def set_array
    @category_parent_array = Category.where(ancestry: nil)
  end

end
