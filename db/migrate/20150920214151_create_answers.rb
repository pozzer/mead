class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.interger :user_id
      t.interger :question_id
      t.timestamp
    end
  end
end
