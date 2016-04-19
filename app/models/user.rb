class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  before_validation :clear_phone

  validates :name, :phone, presence: true
  validates :phone, length: { in: 10..11 }
  validates :email, presence: true, if: "uid.nil?"
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, if: "uid.nil?", on: :create

  has_many :shopping_carts, dependent: :destroy
  has_many :orders, through: :shopping_carts
  has_many :providers
  has_one :address
  accepts_nested_attributes_for :address
  validates_associated :address

  before_validation(on: :create) do
    self.password = Devise.friendly_token[0,20] if attribute_present?("uid")
  end

  def shopping_cart
    shopping_carts.order(created_at: :desc).first
  end

  def self.from_omniauth(auth)
    p auth.as_json
    where(uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def clear_phone
    self.phone = self.phone.gsub(/[ \(\)\-]/i,'')
  end
end