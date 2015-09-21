class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :answer_id
      t.boolean :best, :default=>false, :null=>false
      t.timestamp
    end
  end
end

