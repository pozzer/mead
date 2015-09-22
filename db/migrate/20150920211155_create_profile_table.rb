class CreateProfileTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
			t.string :first_name
			t.string :last_name
			t.date :birth_date
			t.string :state_id
			t.string :city_id
			t.text :about
			t.string :organization_name
			t.timestamps :null => false
    end
  end
end
