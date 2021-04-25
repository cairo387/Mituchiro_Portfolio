class Chiropractor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :treatment

  #画像投稿用(refile)
  attachment :image

  enum sex: {
    male: 0,
    female: 1,
    not_applicable: 2,
  }
end
