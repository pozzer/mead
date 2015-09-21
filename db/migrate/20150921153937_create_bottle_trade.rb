class CreateBottleTrade < ActiveRecord::Migration
  def change
    create_table :bottle_trades do |t|
      t.integer :owner_id
      t.integer :trade_id
      t.integer :bottle_id
      t.integer :amount
      t.timestamp
    end
  end
end
