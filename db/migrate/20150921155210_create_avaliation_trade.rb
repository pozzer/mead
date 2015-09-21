class CreateAvaliationTrade < ActiveRecord::Migration
  def change
    create_table :avaliation_trades do |t|
      t.integer :rating
      t.text :content
      t.integer :trade_id
      t.integer :assessed_id
      t.integer :appraiser_id
      t.timestamp
    end
  end
end
