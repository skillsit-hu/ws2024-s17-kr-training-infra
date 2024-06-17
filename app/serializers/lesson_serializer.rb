class LessonSerializer < ActiveModel::Serializer

  attributes :room_id, :room_title, :course_id, :course_title, :date, :from, :to, :time_slot

  def from
    object.from.try :strftime, '%H:%M'
  end

  def to
    object.to.try :strftime, '%H:%M'
  end

  def course_title
    object.course.title
  end

  def room_title
    object.room.title
  end 

  def time_slot
    "#{self.from} ~ #{self.to}"
  end
end
