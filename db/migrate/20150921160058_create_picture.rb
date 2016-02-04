class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.attachment :picture
      t.integer :attachable_id
      t.string :attachable_type
      t.integer :picture_type
      t.timestamps null: false
    end
  end
end
