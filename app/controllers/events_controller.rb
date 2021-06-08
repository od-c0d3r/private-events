class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  
  def index

  end

  def create
    @event = current_user.events.build(user_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end

private 

def user_params
   params.permit(:date, :location) 
end