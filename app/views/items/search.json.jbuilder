json.array! @items do |item|
  json.id item.id
  json.price item.price
  json.detail item.detail
  json.item_name item.item_name
end