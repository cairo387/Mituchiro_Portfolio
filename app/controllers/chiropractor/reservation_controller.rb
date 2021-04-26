class Chiropractor::ReservationController < ApplicationController
  def index
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservations = Reservation.where(chiropractor_id: current_chiropractor.id).order(" created_at DESC ").page(params[:page]).per(20)
  end
end
