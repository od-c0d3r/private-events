class TokensController < ApplicationController
     def index
          
     end

     def create
          event = Event.find(params[:token][:event_id])
          event.attendees << current_user
          redirect_to user_path(event.creator_id)
     end
     
     def destroy
          event = Event.find(params[:token][:event_id])
          event.attendees.delete(current_user)
          redirect_to events_path
     end
     
end
