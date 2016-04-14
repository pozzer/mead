class ChangeCollumnBottle < ActiveRecord::Migration
  def change
  	change_column :bottles, :private, :boolean, :default => false, :null => false
  end
end
	