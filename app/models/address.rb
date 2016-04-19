class Address < ActiveRecord::Base

  STATES = %w(AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO)

  belongs_to :user

  validates :zipcode, presence: true
  validates :address, presence: true
  validates :number, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
end