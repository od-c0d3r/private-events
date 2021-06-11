class UsersController < ApplicationController
  def show
    @user = User.find_by(user_params)
    @user_events = @user.events
    @user_future_events = @user.attended_events.upcoming
    @user_past_events = @user.attended_events.past

  end


end


private

def user_params
  params.permit(:id)
end
