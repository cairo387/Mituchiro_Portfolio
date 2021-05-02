class Article < ApplicationRecord
  belongs_to :admin
  belongs_to :genre

  #画像投稿用(refile)
  attachment :image

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
