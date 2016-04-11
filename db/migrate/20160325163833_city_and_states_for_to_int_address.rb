class CityAndStatesForToIntAddress < ActiveRecord::Migration
  def change
		remove_column :addresses, :city
		remove_column :addresses, :state
		Address.reset_column_information
		add_column :addresses, :city_id, :integer, index: true, foreign_key: true
		add_column :addresses, :state_id, :integer, index: true, foreign_key: true
  end
end
