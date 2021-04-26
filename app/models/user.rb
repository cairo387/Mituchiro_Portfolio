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

  enum sex: {
    male: 0,
    female: 1,
    not_applicable: 2,
  }

  def favorited_by?(chiropractor_id)
    favorites.where(chiropractor_id: chiropractor_id).exists?
  end
end
