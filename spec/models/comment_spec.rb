require 'rails_helper'

describe Comment do
  describe '#create' do
    # 1
    it "text,user_id,item_id,が存在すれば登録できること" do
      item = build(:comment)
      expect(comment).to be_valid
    end

    # # 2
    it " text,がない場合は登録できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    # # 3
    it " user_id,がない場合は登録できないこと" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include("can't be blank")
    end

    # # 4
    it " item_id,がない場合は登録できないこと" do
      comment = build(:comment, item_id: nil)
      comment.valid?
      expect(comment.errors[:item_id]).to include("can't be blank")
    end
    
  end
end