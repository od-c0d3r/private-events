require 'rails_helper'
require 'user'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'Tanzila', email: 'tanzila@example.com', password: '123123') }
  let(:event) { Event.create(date: '10/2/2021', location: 'Sentorini', creator_id: user.id) }
  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is not valid without a date' do
    event = Event.new(date: nil)
    expect(event).to_not be_valid
  end

  it 'is not valid without a location' do
    event = Event.new(location: nil)
    expect(event).to_not be_valid
  end
end
