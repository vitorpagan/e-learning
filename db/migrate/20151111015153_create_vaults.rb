class CreateVaults < ActiveRecord::Migration
  def change
    create_table :vaults do |t|
      t.integer :final_digits
      t.string :code
      t.string :flag
      t.boolean :active, default: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :vaults, :users
  end
end
