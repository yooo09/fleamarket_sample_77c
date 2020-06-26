FactoryBot.define do

  factory :item do
    item_name             {"マスク"}
    detail                {"マスクです"}
    condition             {"1"}
    delivery_fee          {"送料込み(出品者負担)"}
    shipping_area         {"1"}
    delivery_time         {"1~2日で発送"}
    price                 {"1000"}
    brand_id              {"グッチ"}
    category_id           {"1"}
    images                {"1"}
  end
end

