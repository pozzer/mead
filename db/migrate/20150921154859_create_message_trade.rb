class CreateMessageTrade < ActiveRecord::Migration
  def change
    create_table :message_trades do |t|
      t.integer :user_id
      t.integer :trade_id
      t.text :content
      t.timestamps
    end
  end
end
