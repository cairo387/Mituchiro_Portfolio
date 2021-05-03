class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservation = Reservation.new
    @reservation.start_date = Time.parse(params[:start])
    @reservation.end_date = Time.parse(params[:end])
    @reservation.chiropractor_id = params[:chiropractor_id]
  end

  def confirm
    @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @event = Event.find_by(chiropractor_id: @reservation.chiropractor_id, start: @reservation.start_date)
    @event.title = '×'
    @event.description = '予約不可'
    @event.textColor="gray"
    @event.save
    if @reservation.save
      redirect_to reservations_completed_path
    else
      @reservation = Reservation.new(reservation_params)
      @wd = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
      render :new
    end
  end

  def completed
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :postal_code, :address, :phone_number, :station, :start_date, :end_date, :chiropractor_id)
  end
end
