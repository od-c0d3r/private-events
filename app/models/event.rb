class Event < ApplicationRecord
  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }

  has_many :tokens
  has_many :attendees, through: :tokens
  belongs_to :creator, class_name: :User

  validates :date, presence: true
  validate :create_recent_date
  validates :location, presence: true

  def create_recent_date
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
