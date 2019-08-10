require 'test_helper'

class FieldsWithErrorsTest < ActionView::TestCase
  setup do
    @form = Form.new
    @form.errors.add(:email, :invalid)

    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :vertical_form, wrapper_mappings: {})

    @original_proc = ActionView::Base.field_error_proc
    ActionView::Base.field_error_proc = proc { |input, _instance| input }
  end

  teardown do
    ActionView::Base.field_error_proc = @original_proc
  end

  def test_required_email_field_with_error
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="form-group email required form_email form-group-invalid">
        <label class="form-control-label email required" for="form_email">Email address <abbr title="required">*</abbr></label>
        <input aria-invalid="true" class="form-control is-invalid string email required" id="form_email" name="form[email]" placeholder="Enter email" type="email"/>
        <div class="invalid-feedback">Email is invalid</div>
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
