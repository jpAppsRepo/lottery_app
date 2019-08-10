class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :form_id
      t.integer :question_id
      t.integer :sub_question_id
      t.string :form_name
      t.string :question_text
      t.string :value

      t.timestamps
    end
  end
end
