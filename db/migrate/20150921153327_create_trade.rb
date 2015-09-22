class CreateTrade < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :negotiator_id
      t.integer :negotiant_id
      t.integer :status
      t.timestamps :null => false
    end
  end
end
