class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :zipcode, limit: 10
      t.string :address, limit: 255
      t.integer :number
      t.string :complement, limit: 50
      t.string :district, limit: 100
      t.string :city, limit: 100
      t.string :state, limit: 100
      t.string :country, limit: 100

      t.timestamps
    end
  end
end
