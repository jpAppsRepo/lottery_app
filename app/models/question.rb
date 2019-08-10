class Question < ApplicationRecord
  # model association
  belongs_to :form

  # validations
  validates_presence_of :form_id, :sub_question_id, :title, :description
end
