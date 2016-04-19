class PublicTarget < ActiveRecord::Base
  has_and_belongs_to_many :video_classes
  validates :name, presence: true
end