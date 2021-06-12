class Event < ApplicationRecord
  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }

  has_many :tokens
  has_many :attendees, through: :tokens
  belongs_to :creator, class_name: :User

  validates :date, presence: true

  validates :location, presence: true

end
