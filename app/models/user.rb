class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  mount_uploader :image, ImageUploader
  
  has_many :items
  has_one :credit_card, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sns_credentials
  has_many :likes, dependent: :destroy
  has_one :adress
  
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :encrypted_password, length: { minimum: 7 }
  validates :password, confirmation: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true



  #ここから下SNSAPI使用↓
  # def self.from_omniauth(auth)
  #   if RAILS_ENV= development
  #     sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  #     # sns認証したことがあればアソシエーションで取得
  #     # 無ければemailでユーザー検索して取得orビルド(保存はしない)
  #     user = sns.user || User.where(email: auth.info.email).first_or_initialize(
  #       nickname: auth.info.name,
  #         email: auth.info.email
  #     )
  #     # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
  #     if user.persisted?
  #       sns.user = user
  #       sns.save
  #     end
  #     { user: user, sns: sns }
  #   end
  # end


end
