class CourseSerializer < ActiveModel::Serializer
  attributes  :id, :name, :price, :thumbnail, :level,
              :description, :video_classes_count, :slug
  has_one :category
  has_one :level

  def video_classes_count
    object.video_classes.size
  end
end