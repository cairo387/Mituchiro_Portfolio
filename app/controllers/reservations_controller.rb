class ReservationsController < ApplicationController
  def new
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservation = Reservation.new
    @reservation.start_date=Time.parse(params[:start])
    @reservation.end_date=Time.parse(params[:end])
  end

  def confirm
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_completed_path
    else
      render :confirm
    end
  end

  def completed
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :postal_code, :address, :phone_number, :station, :start_date, :end_date)
  end
end
