class CreateNotification < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
			t.belongs_to :trackable, :polymorphic => true
      t.belongs_to :user
      t.string  	 :key
      t.boolean 	 :read, default: false
    	t.timestamps
    end
  end
end
