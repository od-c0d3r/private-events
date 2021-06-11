class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @events = Event.all
    @future_events = @events.upcoming
    @past_events = @events.past
  end

  def create
    @event = current_user.events.build(user_params)
    if @event.save
      redirect_to root_path
    else
      flash[:danger] = 'Error: Past Date or Empty Location'
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find_by(user_params)
  end
end

private

def user_params
  params.permit(:date, :location, :id)
end
