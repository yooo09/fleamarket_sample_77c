class CreditCardsController < ApplicationController
  require 'payjp'
  Payjp.api_key = "sk_test_b35834d5428660e31c8ca8fb"
  # Payjp.api_key = ENV[""]
  before_action :set_item,only:[:buy,:pay]
  before_action :take_credit_card,only:[:buy,:pay]
  before_action :set_api_key


  # def index
  # end


  def new
    @credit_card = CreditCard.new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = CreditCard.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
    end
      if @card.save
        flash[:notice] = '登録しました'
        # redirect_to "new_item_path"
      else
        flash[:alert] = '登録できませんでした'
        # redirect_to new_user_credit_card_path
      end
  end
    
  def edit
  end

  def update
  end

  def buy
  # binding.pry
    if @credit_card.blank?
      flash[:alert] = '購入前にカード登録してください'
      redirect_to '#' and return
    else
      #保管した顧客IDでpayjpから情報取得
      set_customer
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      set_credit_card_information
    end
    # if current_user.adress == nil
    #   flash[:alert] = '購入前に住所登録してください'
    #   redirect_to '#'
    # end
  end


  def pay
    @item.update(customer_id: current_user.id)
    # 現在のユーザーを購入者に登録
    Payjp::Change.create(
      :amount => @item.price,
      :customer => @credit_card.customer_id
      # :currency => 'jpy',#日本円
    )
    redirect_to "/"
  end

  private 
    def set_item
      @item = Item.find(params[:id])
      # @adress = Adress.find_by(user_id:current_user.id)
    end

    def set_api_key
      Payjp.api_key = Rails.application.credentials[:payjp][:payjp_secret_key]
      binding.pry
    end

    def set_customer
      @customer = Payjp::Customer.retrive(@credit_card.customer_id)
      # customerに、pay.jpのcustomer_idを取得し、格納
    end

    def set_card_information
      @credit_card_information = @customer.credit_cards.retrive(@credit_card.card_id)
    end

    def take_card
      @credit_card =CreditCard.find_by(user_id: current_user.id)
    end
  
    def credit_params
      params.require(:credit_card).permit(:customer_id).merge(user_id: current_user.id)
    end
  
end
