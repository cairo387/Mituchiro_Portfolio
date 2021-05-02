class Chiropractor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :treatment
  has_many :reservations, dependent: :destroy

  #画像投稿用(refile)
  attachment :image

  #バリデーション
  validates :name, presence: true
  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :address_city, presence: true
  validates :phone_number, presence: true
  validates :fare, presence: true
  validates :service_charge, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :treatment_time, presence: true

  enum sex: {
    male: 0,
    female: 1,
    not_applicable: 2,
  }
end
