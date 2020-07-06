class ItemsController < ApplicationController
  require 'payjp'
  Payjp.api_key = "sk_test_b35834d5428660e31c8ca8fb"
  before_action :set_item, only: [:confirm, :destroy, :show, :edit, :update, :purchase, :pay, :done]


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
   
  def purchase
    @items = Item.all
    credit_card = current_user.credit_card
    Payjp.api_key = "sk_test_b35834d5428660e31c8ca8fb"
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
    @user = current_user
    @items = Item.all
    credit_card = current_user.credit_card
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
    return nil if params[:keyword] == ""
    @items = Item.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  
  

  def pay
    credit_card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp = "sk_test_b35834d5428660e31c8ca8fb"
    Payjp::Charge.create(
      amount: @item.price, # Payjpに載る金額
      customer: credit_card.customer_id,
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user.id)
    redirect_to root_path
    flash[:notice] = '購入が完了しました'
  end

  # def done
  #   @item.update( customer_id: current_user.id)
  #   redirect_to root_path
  # end

  

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
    Payjp.api_key = Rails.application.credentials.payjp = "sk_test_b35834d5428660e31c8ca8fb"
  end
  
end
