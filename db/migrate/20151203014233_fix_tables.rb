class FixTables < ActiveRecord::Migration
  def change
  	add_column :profiles, :user, :integer
  	remove_column :users, :name
  end
end
