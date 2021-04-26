class EventsController < ApplicationController
  def new
    @event = Event.where(chiropractor_id: params[:chiropractor_id])
    render json: @event
  end
end
