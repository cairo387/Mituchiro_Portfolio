class ChiropractorsController < ApplicationController
  def index
    @chiropractors = Chiropractor.all
  end
end
