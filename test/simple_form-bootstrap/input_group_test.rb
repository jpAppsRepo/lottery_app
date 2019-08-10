require 'test_helper'

class InputGroupFormTest < ActionView::TestCase
  setup do
    @form    = Form.new
    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_input_group_prepend
    actual = @builder.input(:name, wrapper: :input_group, prepend: "$")
    expected = <<-HTML
      <div class="form-group string required form_name">
        <label class="form-control-label string required" for="form_name">Name <abbr title="required">*</abbr></label>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">$</span>
          </div>
          <input class="form-control string required" id="form_name" name="form[name]" placeholder="Your name" type="text"/>
        </div>
        <small class="form-text text-muted">Text input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_group_append
    actual = @builder.input(:name, wrapper: :input_group, append: ".00")
    expected = <<-HTML
      <div class="form-group string required form_name">
        <label class="form-control-label string required" for="form_name">Name <abbr title="required">*</abbr></label>
        <div class="input-group">
          <input class="form-control string required" id="form_name" name="form[name]" placeholder="Your name" type="text"/>
          <div class="input-group-append">
            <span class="input-group-text">.00</span>
          </div>
        </div>
        <small class="form-text text-muted">Text input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_group_prepend_and_append
    actual = @builder.input(:name, wrapper: :input_group, prepend: "$", append: ".00")
    expected = <<-HTML
      <div class="form-group string required form_name">
        <label class="form-control-label string required" for="form_name">Name <abbr title="required">*</abbr></label>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">$</span>
          </div>
          <input class="form-control string required" id="form_name" name="form[name]" placeholder="Your name" type="text"/>
          <div class="input-group-append">
            <span class="input-group-text">.00</span>
          </div>
        </div>
        <small class="form-text text-muted">Text input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
