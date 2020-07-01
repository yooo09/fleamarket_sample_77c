class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :credit_cards
  has_many :items
  has_many :comments, dependent: :destroy
  
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :encrypted_password, length: { minimum: 7 }
  validates :password, confirmation: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true

  has_many :likes, dependent: :destroy
end
