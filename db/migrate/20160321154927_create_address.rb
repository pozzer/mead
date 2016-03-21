class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :state
      t.string :city
      t.string :street
      t.string :district
      t.string :number
      t.text :additional
      t.timestamps null: false
    end
  end
end
