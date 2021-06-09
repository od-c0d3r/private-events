class Event < ApplicationRecord
    # has_many :userevents, foreign_key: :attended_event_id
    # has_many :attendees, through: :userevents, source: :attendee
    belongs_to :creator, class_name: "User", foreign_key: :user_id
end
