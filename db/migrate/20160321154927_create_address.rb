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
      t.references :profile, index: true, foreign_key: true
      t.timestamps null: false

    end
  end
end
