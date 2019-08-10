class ResultsController < ApplicationController
  # GET /results/patients
  def index
    @patients = User.get_patients
  end
  
  # GET /results/:patient_id
  def show
    @answers = Answer.get_answers(params[:patient_id])
  end

  def export
    # download csv or xls
    @answers = Answer.get_answers_for_export(params[:patient_id])

    respond_to do |format|
      format.html
      format.csv { send_data @answers.to_csv }
      format.xls { send_data @answers.to_csv(col_sep: "\t") }
    end
  end
end
