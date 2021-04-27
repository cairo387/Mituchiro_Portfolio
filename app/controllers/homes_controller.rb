class HomesController < ApplicationController
  def top
    @articles = Article.limit(4).order(" created_at DESC ")
    @chiropractors = Chiropractor.limit(3).order(" created_at DESC ")
  end

  def about
  end

  def new_guest
    #guestユーザーをメールアドレスにて探す、なければ作る
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      user.nickname = 'ゲスト'
      user.name = 'ゲスト太郎'
      user.postal_code = '1111111'
      user.address_city = 'ゲスト県ゲスト市ゲスト町1丁目'
      user.address_street = '111-11'
      user.phone_number = '00000000000'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
