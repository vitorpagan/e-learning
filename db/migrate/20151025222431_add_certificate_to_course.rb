class AddCertificateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :certificate, :string
  end
end
