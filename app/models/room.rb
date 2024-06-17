class Room < ApplicationRecord
  has_many :unavailable_times, class_name: "RoomUnavailableTime",  dependent: :destroy
  has_many :lessons, dependent: :nullify

  validates :title, presence: true, uniqueness: true
end
