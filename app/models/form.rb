class Form < ApplicationRecord
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |title, value| send("#{title}=", value) } unless attributes.nil?
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.path)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.path}"
    end
  end

  def load_imported_forms
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(5)
    (6..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      form = Form.find_by_id(row["id"]) || Form.new
      form.attributes = row.to_hash
      form
    end
  end

  def imported_forms
    @imported_forms ||= load_imported_forms
  end

  def save
    if imported_forms.map(&:valid?).all?
      imported_forms.each(&:save!)
      true
    else
      imported_forms.each_with_index do |form, index|
        form.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
  end
  # model association
  # has_many :questions, dependent: :destroy

  # validations
  # validates_presence_of :title, :description
end
