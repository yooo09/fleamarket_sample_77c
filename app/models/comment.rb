class Comment < ApplicationRecord
  belongs_to :item  
  belongs_to :user 

  validates :text, :user_id, :item_id, presence: true
end
