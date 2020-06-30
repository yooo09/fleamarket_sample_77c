require 'rails_helper'

describe Item do
  describe '#create' do
    # 1
    it "item_name,images,detail,condition,delivery_fee,shipping_area,delivery_time,price,user_id,category_id,が存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    # # 2
    it " item_nameがない場合は登録できないこと" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank")
    end

    # # 3
    it "detailがない場合は登録できないこと" do
      item = build(:item, detail: nil)
      item.valid?
      expect(item.errors[:detail]).to include("can't be blank")
    end

    # # 4
    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    # # 5
    it "delivery_feeがない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("can't be blank")
    end

    # # 6
    it "shipping_areaがない場合は登録できないこと" do
      item = build(:item, shipping_area: nil)
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end

    # # 7
    it "delivery_timeがない場合は登録できないこと" do
      item = build(:item, delivery_time: nil)
      item.valid?
      expect(item.errors[:delivery_time]).to include("can't be blank")
    end

    # # 8
    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # # 9
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    
  end
end