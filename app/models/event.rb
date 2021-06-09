class Event < ApplicationRecord
    has_many :tokens
    has_many :attendees, through: :tokens
    belongs_to :creator, class_name: :User
end
