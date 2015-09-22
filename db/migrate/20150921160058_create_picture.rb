class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_update_at
      t.integer :attachable_id
      t.string :attachable_type
      t.timestamps :null => false
    end
  end
end
