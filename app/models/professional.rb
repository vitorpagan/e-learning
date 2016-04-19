class Professional < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  has_many :video_classes
  validates :name, presence: true
end