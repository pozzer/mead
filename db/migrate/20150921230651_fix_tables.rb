class FixTables < ActiveRecord::Migration
  def change
  	remove_column :questions, :best
		remove_column :questions, :answer_id
  	add_column :answers, :best, :boolean, :default=>false, :null=>false
  end
end
