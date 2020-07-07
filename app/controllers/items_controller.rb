class ItemsController < ApplicationController
  before_action :set_item, only: [:confirm, :destroy, :show, :edit, :update, :purchase, :pay]
  before_action :set_category, only: [:index, :new, :show, :search, :deep_search, :purchase]
  before_action :set_category_link, only: [:show]
  before_action :set_item_search_query
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  

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
   
  def purchase
    @items = Item.all
    credit_card = current_user.credit_card
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @customer_card = customer.cards.retrieve(credit_card.card_id)
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        # 例えば、Pay.jpからとってきたカード情報の、ブランドが"Visa"だった場合は返り値として
        # (画像として登録されている)Visa.pngを返す
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.png"
      when "Diners Club"
        @card_src = "diners.png"
      when "Discover"
        @card_src = "discover.png"
      end
  end
  
  def show
    @items = Item.all
    credit_card = current_user.credit_card
    @likes_count = Like.where(item_id: @item.id).count
    @user_items = Item.where(buyer_id: nil, user: @item.user).limit(5)
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
    if @item.user_id != current_user.id
    redirect_to root_path
    end
  end

  def search
    @items = Item.all.search(params[:search])
  end

  def deep_search
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    credit_card = CreditCard.find_by(user_id: current_user.id)
    Payjp::Charge.create(
      amount: @item.price, # Payjpの売り上げに記載される金額
      customer: credit_card.customer_id,
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user.id)
    redirect_to root_path
    flash[:notice] = '購入が完了しました'
  end


private

  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:condition,:delivery_fee,:shipping_area,:delivery_time,:price,:brand_id,:category_id,images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def buyer
    require(:item).permit(:buyer_id).merge(buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_api_key
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
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
end

