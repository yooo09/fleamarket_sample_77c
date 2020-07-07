require 'rails_helper'

describe CreditCard do
  describe '#create' do
    # 1
    it "customer_idがある場合は登録できること" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid

    end
  end
end