class AnswersController < ApplicationController
   # GET /forms/:form_id/questions/:question_id/answers
   def index
    json_response(@question.answers)
  end

  # GET /forms/:form_id/questions/:question_id/answer/:id
  def show
    json_response(@answer)
  end

  # POST /forms/:form_id/questions/:question_id/answers
  def create
    @question.answers.create!(answer_params)
    json_response(@question, :created)
  end

  # PUT /forms/:form_id/questions/:question_id/answer/:id
  def update
    @answer.update(answer_params)
  end

  private

  def answer_params
    params.permit(:user_id, :form_id, :question_id, :sub_question_id, :form_name, :question_text, :value)
  end
end
