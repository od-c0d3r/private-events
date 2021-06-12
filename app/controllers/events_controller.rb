class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @future_events = Event.all.upcoming
    @past_events = Event.all.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      flash[:danger] = 'Error: Past Date or Empty Location'
      render :new
    end
  end

  def show
    @event = Event.find_by(params[:id])
  end
end

private

def event_params
  params.require(:event).permit(:date, :location)
end
