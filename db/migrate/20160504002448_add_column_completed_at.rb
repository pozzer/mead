class AddColumnCompletedAt < ActiveRecord::Migration
  def change
  	add_column :trades, :finished_at, :timestamp
  end
end
