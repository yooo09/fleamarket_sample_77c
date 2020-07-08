class CreditCardsController < ApplicationController
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  before_action :set_category, only: [:new, :show]
  before_action :authenticate_user!

  def new
    
    @credit_card = CreditCard.new
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループする
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = CreditCard.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
    end
      if @card.save
        flash.now[:notice] = '登録しました'
        redirect_to root_path
      else
        flash[:alert] = '登録できませんでした'
      end
  end
    
  def show 
   credit_card = current_user.credit_card
   if credit_card.blank?
    redirect_to  new_user_credit_card_path
   else
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @customer_card = customer.cards.retrieve(credit_card.card_id)
    end
  end
  

  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  def destroy
    credit_card = current_user.credit_card
    if credit_card.blank?
      redirect_to new_user_credit_card_path
    else
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      #ここでpay.jpの方を消している
      credit_card.delete
      #ここでテーブルにあるcardデータを消している
      redirect_to new_user_credit_card_path
    end  
  end

  
  
end
