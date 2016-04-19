class AddLevelIdToCourses < ActiveRecord::Migration
  def change
    change_table(:courses) do |t|
      t.references :level, index: true
    end
  end
end
