class ChiropractorsController < ApplicationController
  def index
    @chiropractors = Chiropractor.all.page(params[:page]).per(3)
  end
end
