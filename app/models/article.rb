class Article < ApplicationRecord
  belongs_to :admin

  #画像投稿用(refile)
  attachment :image

end
