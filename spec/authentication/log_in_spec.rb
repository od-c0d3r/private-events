# require 'rails_helper'
# require 'user'

# RSpec.describe , :type => :model do
#   it "renders the index template" do
#     get :index
#     expect(response).to render_template("index")
#   end
# end

require 'rails_helper'

RSpec.describe 'Event management', type: :request do
  it 'creates a Event and redirects to Sign-In page' do
    get '/events/new'
    expect(response).to redirect_to(new_user_session_path)

    post '/events', params: { event: { date: '05/07/2021', location: 'House' } }

    expect(response).to redirect_to(new_user_session_path)
  end

  it 'does not render a different template' do
    get '/events/new'
    expect(response).to_not render_template(:show)
  end
end
