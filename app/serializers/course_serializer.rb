class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :description, :state

  has_many :lessons
end
