class AddColumnSymbolStates < ActiveRecord::Migration
  def change
  	add_column :states, :symbol, :string, limit: 3
  end
end
