class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :chiropractor

  #バリデーション
  validates :name, presence: true
  validates :station, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンありの７桁の半角数字で入力してください' }
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなし10~11桁の半角数字で入力してください' }

  #曜日表示のための変数定義
  JA_WEEK_DAYS = [
    { value: 0, short_text: "(日)" },
    { value: 1, short_text: "(月)" },
    { value: 2, short_text: "(火)" },
    { value: 3, short_text: "(水)" },
    { value: 4, short_text: "(木)" },
    { value: 5, short_text: "(金)" },
    { value: 6, short_text: "(土)" },
  ]

  def display_start_date
    start_date.strftime("%Y年%m月%d日#{ja_week_day_short_text(start_date.wday)} %H:%M")
  end

  def ja_week_day_short_text(wday)
    JA_WEEK_DAYS.detect { |week_day| week_day[:value] == wday }[:short_text]
  end
end
