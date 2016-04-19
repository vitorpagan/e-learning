class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
