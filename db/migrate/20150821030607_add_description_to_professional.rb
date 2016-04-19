class AddDescriptionToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :description, :string
  end
end
