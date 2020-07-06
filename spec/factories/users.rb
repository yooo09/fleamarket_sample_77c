FactoryBot.define do

  factory :user do
    nickname              {"テスト"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    birthday              {"00000000"}
    last_name             {"test"}
    first_name            {"test"}
    last_name_kana        {"test"}
    first_name_kana       {"test"}
  end

end


