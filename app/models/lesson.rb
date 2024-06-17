class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :room

  default_scope -> { order('date asc, `from` asc') }

  scope :in_range, -> (f = nil, t = nil) {
    from = f || Date.today.beginning_of_month
    to = t || from.to_date.end_of_month
    where(["date >= ? and date <=?", from, to])
  }
end
