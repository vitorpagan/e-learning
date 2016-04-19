class RemoveLastNameFromProfessional < ActiveRecord::Migration
  def change
    remove_column :professionals, :last_name, :string
  end
end
