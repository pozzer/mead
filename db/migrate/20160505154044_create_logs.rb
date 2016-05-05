class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :trade_id
      t.integer :user_id
      t.integer :status
      t.integer :log_type
      t.text :message
      t.timestamps
    end
  end
end
