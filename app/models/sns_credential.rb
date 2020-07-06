class SnsCredential < ApplicationRecord
  #SNSAPI使用↓
  #optional: trueはアソシエーションによって紐づけられた外部キーの値が存在していなくても、データベースに保存することができるオプション
  # belongs_to :user, optional: true
end
