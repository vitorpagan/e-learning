class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :categories, foreign_key: :parent_id
  has_many :courses
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id
  validates :name, presence: true

  def self.first_level(id)
    Category.where(parent: nil).where.not(id: id)
  end

  def video_classes_count
    VideoClass.includes(:courses).where(courses: { category_id: self.id }).size
  end
end