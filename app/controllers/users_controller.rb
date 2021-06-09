class UsersController < ApplicationController
    def show
        @user = User.find_by(user_params)
        @user_events = @user.events
    end
end


private 

def user_params
   params.permit(:id) 
end
