class CategoriesController < ApplicationController
  before_action :set_category_link, only: [:show]
  before_action :set_category, only: [:index, :show]

  def index
  end


  def show
    @items = @category.set_items
    @items = @items.where(customer_id: nil).order("created_at DESC")
  end


  private

  def set_category_link
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end

end
