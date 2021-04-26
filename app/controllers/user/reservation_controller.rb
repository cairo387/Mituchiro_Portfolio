class User::ReservationController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id).order(" created_at DESC ")
  end
end
