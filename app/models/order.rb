class Order < ActiveRecord::Base
  belongs_to :shopping_cart
  enum payment_method_id: ['CartaoCredito', 'DebitoBancario', 'BoletoBancario']
  enum status: [:pending, :approved, :initiated, :printed, :completed, :canceled, :verifying, :refunded]
end