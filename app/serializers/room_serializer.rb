class RoomSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :capacity, :lessons, #, :created_at, :updated_at

  def lessons
    from = @instance_options[:date_from]
    to = @instance_options[:date_to]

    # if no range provided, return the default range. (current month)
    les = from ? object.lessons.in_range(from, to) : object.lessons.in_range
    les.map {|le| LessonSerializer.new(le)}
  end
end
