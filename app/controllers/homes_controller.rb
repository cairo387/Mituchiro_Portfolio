class HomesController < ApplicationController
  def top
    @articles = Article.limit(4).order(" created_at DESC ")
    @chiropractors = Chiropractor.limit(3).order(" created_at DESC ")
  end

  def about
  end
end
