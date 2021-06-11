class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @events = Event.all
    @future_events = @events.upcoming
    @past_events = @events.past
  end

  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(user_params)
  end
end

private

def user_params
  params.require(:event).permit(:date, :location, :id)
end
