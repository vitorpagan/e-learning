class AddIdentifierToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :identifier, :string
  end
end
