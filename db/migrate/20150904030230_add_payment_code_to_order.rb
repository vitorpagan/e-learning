class AddPaymentCodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payment_code, :string
  end
end
