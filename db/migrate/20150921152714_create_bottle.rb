class CreateBottle < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :label
      t.string :organization_name
      t.date :filling_date
      t.string :style
      t.integer :amount
      t.text :about
      t.string :measure
      t.string :abv
      t.boolean :private
      t.integer :user_id
      t.timestamp
    end
  end
end
