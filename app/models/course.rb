class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  belongs_to :level
  has_and_belongs_to_many :video_classes
  has_many :user_courses

  validates :category, :level, :name, :description, presence: true

  mount_uploader :thumbnail, ImageUploader
  mount_uploader :certificate, ImageUploader

  def duration
    VideoClass.includes(:courses).where(courses: { id: self.id }).sum(:duration)
  end

  def video_classes_count
    VideoClass.includes(:courses).where(courses: { id: self.id }).size
  end
end