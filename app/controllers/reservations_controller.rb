class ReservationsController < ApplicationController
  def new
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservation = Reservation.new
    @reservation.start_date=Time.parse(params[:start])

  end

  def confirm
  end

  def update
  end
end
