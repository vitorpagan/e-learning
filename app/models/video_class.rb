class VideoClass < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :courses
  has_and_belongs_to_many :public_targets
  has_and_belongs_to_many :prerequisites
  belongs_to :professional
  has_many :user_videos

  validates :professional, :title, :description, :duration, :price, presence: true
  mount_uploader :thumbnail, ImageUploader
  mount_uploader :handout, GeneralUploader
end
