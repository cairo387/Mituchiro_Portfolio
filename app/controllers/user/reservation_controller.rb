class User::ReservationController < ApplicationController
  before_action :authenticate_user!
  def index
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservations = Reservation.where(user_id: current_user.id).order(" created_at DESC ").page(params[:page]).per(20)
  end
end
