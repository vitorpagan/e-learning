class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :id_transaction
      t.integer :status
      t.string :content

      t.timestamps null: false
    end
  end
end
