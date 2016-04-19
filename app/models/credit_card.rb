class CreditCard
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :number, :cvv, :expiration_year, :expiration_month
  validates :name, presence: true,
                    length: { minimum: 5 }

  validates :number, presence: true,
                    length: { minimum: 15, maximum: 16 }

  validates :cvv, presence: true,
                    length: { minimum: 3, maximum: 4 }

  validates :expiration_year, presence: true
  validates :expiration_month, presence: true

  def build_moip_json
    {
        credit_card: {
            holder_name: self.name,
            number: self.number,
            expiration_month: self.expiration_month,
            expiration_year: self.expiration_year[2..3]
        }
    }.to_json
  end
end