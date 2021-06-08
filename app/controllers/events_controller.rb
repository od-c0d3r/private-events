class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  
  def index

  end

  def create
    @event = current_user.build_event(user_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private 

def user_params
   params.require(:event).permit(:date, :location) 
end