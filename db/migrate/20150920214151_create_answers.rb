class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :user_id
      t.integer :question_id
      t.boolean :answers, :best, :default=>false, :null=>false
      t.timestamps null: false
    end
  end
end
