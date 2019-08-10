require 'test_helper'

class VerticalFormTest < ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper

  setup do
    @form    = Form.new
    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_vertical_simple_form_for
    actual = simple_form_for @form, url: '/forms' do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/forms" class="simple_form new_form" id="new_form" method="post" novalidate="novalidate">
        <input name="utf8" type="hidden" value="&#x2713;"/>
      </form>
    HTML
    assert_xml_equal expected, actual
  end

  def test_horizontal_simple_form_for
    actual = simple_form_for @form, url: '/forms', wrapper: :horizontal_form do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/forms" class="simple_form new_form" id="new_form" method="post" novalidate="novalidate">
        <input name="utf8" type="hidden" value="&#x2713;"/>
      </form>
    HTML
    assert_xml_equal expected, actual
  end

  def test_inline_simple_form_for
    actual = simple_form_for @form, url: '/forms', wrapper: :inline_form, html: { class: "form-inline" } do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/forms" class="simple_form form-inline" id="new_form" method="post" novalidate="novalidate">
        <input name="utf8" type="hidden" value="&#x2713;"/>
      </form>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_group_simple_form_for
    actual = simple_form_for @form, url: '/forms', wrapper: :input_group do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/forms" class="simple_form new_form" id="new_form" method="post" novalidate="novalidate">
        <input name="utf8" type="hidden" value="&#x2713;"/>
      </form>
    HTML
    assert_xml_equal expected, actual
  end

  def test_floating_labels_simple_form_for
    actual = simple_form_for @form, url: '/forms', wrapper: :floating_labels_form do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/forms" class="simple_form new_form" id="new_form" method="post" novalidate="novalidate">
        <input name="utf8" type="hidden" value="&#x2713;"/>
      </form>
    HTML
    assert_xml_equal expected, actual
  end
end
