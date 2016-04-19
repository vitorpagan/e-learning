class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :name
      t.string :uid
      t.references :user, index: true

      t.timestamps
    end
  end
end