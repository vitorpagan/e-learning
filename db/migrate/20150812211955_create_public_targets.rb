class CreatePublicTargets < ActiveRecord::Migration
  def change
    create_table :public_targets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
