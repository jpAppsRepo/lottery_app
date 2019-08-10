require 'test_helper'

class InlineFormTest < ActionView::TestCase
  setup do
    @form    = Form.new
    wrapper_mappings = {
      boolean: :inline_boolean
    }
    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :inline_form, wrapper_mappings: wrapper_mappings)
  end

  def test_required_email_field
    actual = @builder.input(:email, input_html: { class: "mb-2 mr-sm-2" })
    expected = <<-HTML
      <span class="email required form_email">
        <label class="sr-only email required" for="form_email">Email address <abbr title="required">*</abbr></label>
        <input class="form-control string email required mb-2 mr-sm-2" id="form_email" name="form[email]" placeholder="Enter email" type="email"/>
      </span>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_field
    actual = @builder.input_field(:email, class: "form-control mb-2 mr-sm-2")
    expected = <<-HTML
      <input class="string email required form-control mb-2 mr-sm-2" id="form_email" name="form[email]" placeholder="Enter email" type="email"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <span class="form-check flex-wrap justify-content-start mr-sm-2 boolean optional form_terms">
        <input name="form[terms]" type="hidden" value="0"/>
        <input class="form-check-input boolean optional" id="form_terms" name="form[terms]" type="checkbox" value="1"/>
        <label class="form-check-label boolean optional" for="form_terms">Terms</label>
      </span>
    HTML
    assert_xml_equal expected, actual
  end
end
