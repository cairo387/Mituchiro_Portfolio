class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy

   #画像投稿用(refile)
  attachment :image

  #バリデーション
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :nickname, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンありの７桁の半角数字で入力してください' }
  validates :address_city, presence: true
  validates :phone_number, presence: true

  enum sex: {
    male: 0,
    female: 1,
    not_applicable: 2,
  }

  def favorited_by?(chiropractor_id)
    favorites.where(chiropractor_id: chiropractor_id).exists?
  end
end
