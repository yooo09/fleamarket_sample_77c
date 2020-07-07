class ItemsController < ApplicationController
  before_action :set_category, only: [:index, :new, :show, :search, :deep_search]
  before_action :set_category_link, only: [:show]
  before_action :set_item, only: [:confirm, :destroy, :show, :edit, :update, :not_currect_user]
  before_action :set_item_search_query
  before_action :not_currect_user, only: [:edit, :update, :destroy, :confirm]

  def index
    @items = Item.all
    @items = Item.all.order("created_at DESC").limit(40)
  end
  
  
  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end
  
  def edit
  @category_parent = @item.category.parent.parent
  @category_child_array = @item.category.parent.parent.children
  @category_grandchild_array = @item.category.parent.children
  end
  
  def update
    render :edit
  end
  
  def show
    @likes_count = Like.where(item_id: @item.id).count
    @items = Item.all
    @user_items = Item.where(customer_id: nil, user: @item.user).limit(5)
    @comment = Comment.new
    @comments = @item.comments.all
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  def confirm
  end

  def search
    @items = Item.all.search(params[:search])
  end

  def deep_search
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:condition,:delivery_fee,:shipping_area,:delivery_time,:price,:brand_id,:category_id,images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category_link
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end

  def set_item_search_query
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def not_currect_user
    redirect_to root_path if current_user.id != @item.user_id
  end

end



