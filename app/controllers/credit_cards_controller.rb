class CreditCardsController < ApplicationController
  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = @user.credit_cards.new(credit_params)
  end

  def edit
  end

  def update
  end

  private

  def credit_params
    params.permit(:credit_card_type, :card_number, :cvs, :expiation_date, :expiation_year)
  end
  
end
