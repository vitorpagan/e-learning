class AddIdTransactionToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :id_transaction, :string
  end
end
