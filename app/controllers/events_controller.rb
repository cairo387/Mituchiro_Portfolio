class EventsController < ApplicationController
  def index
    @event = Event.all
    render json: @event
  end

  def new
    dd = ["29","30","01","02","03","04","05"]
    hh = "09"
    i = 0
    while(i < 7)
      event = Event.new
      event.id = i+99
      event.title = '◎'
      event.description = '予約可能'
      event.start = "2021-04-#{dd[i]}T#{hh}:00"
      event.end = "2021-04-#{dd[i]}T#{hh}:30"
      event.save
      i= i+1
    end
    redirect_to chiropractors_path
  end

end
