class UsersController < ApplicationController
    def show
        @user_events = User.find(params[:id]).events
    end
end