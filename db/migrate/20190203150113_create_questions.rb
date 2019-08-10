class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :form_id
      t.integer :sub_question_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
