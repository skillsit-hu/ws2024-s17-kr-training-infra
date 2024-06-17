class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  accepts_nested_attributes_for :lessons

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  state_machine :state, initial: :draft do 
    state :reviewing
    state :published

    event :apply_publish do 
      transition [:draft] => :reviewing
    end

    event :publish do 
      transition [:reviewing] => :published
    end

    event :revoke do 
      transition [:published] => :draft
    end
  end

  scope :state, -> (state) { where(state: state) }

end
