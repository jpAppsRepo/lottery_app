class QuestionsController < ApplicationController
  # GET /forms/:form_id/questions
  def index
    json_response(@form.questions)
  end

  # GET /forms/:form_id/questions/:id
  def show
    json_response(@question)
  end
end
