class Answer < ApplicationRecord
  # validations
  validates_presence_of :user_id, :form_id, :question_id, :sub_question_id, :form_name, :question_text, :value

  def self.get_answers(user_id)
    Answer.where(user_id: user_id)
  end

  def self.get_answers_for_export(user_id)
    Answer.select("form_name, question_text, value").where(user_id: user_id)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |form|
        csv << form.attributes.values_at(*column_names)
      end
    end
  end
end
