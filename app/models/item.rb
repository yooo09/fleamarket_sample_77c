class Item < ApplicationRecord
  
  def self.search(search)
    return Item.all() unless search
    Item.where('item_name LIKE(?)', "%#{search}%")
  end
  
end
