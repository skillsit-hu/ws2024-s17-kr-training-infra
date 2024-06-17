class User < ApplicationRecord

  has_secure_password

  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
