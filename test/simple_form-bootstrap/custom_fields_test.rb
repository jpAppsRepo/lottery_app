require 'test_helper'

class CustomFieldsTest < ActionView::TestCase
  setup do
    @form    = Form.new
    wrapper_mappings = {
      boolean:       :custom_boolean,
      check_boxes:   :custom_collection,
      date:          :custom_multi_select,
      datetime:      :custom_multi_select,
      file:          :custom_file,
      radio_buttons: :custom_collection,
      range:         :custom_range,
      time:          :custom_multi_select
    }
    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :vertical_form, wrapper_mappings: wrapper_mappings)
  end

  def test_file_field
    actual = @builder.input(:avatar, as: :file)
    expected = <<-HTML
      <div class="form-group file required form_avatar">
        <label class="form-control-label file required" for="form_avatar">Avatar <abbr title="required">*</abbr></label>
        <div class="custom-file">
          <input class="custom-file-input file required" id="form_avatar" name="form[avatar]" type="file"/>
          <label class="custom-file-label file required" for="form_avatar">Avatar <abbr title="required">*</abbr></label>
        </div>
        <small class="form-text text-muted">File input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons_inline
    actual = @builder.input(:color, as: :radio_buttons, collection: [:a, :b], wrapper: :custom_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons required form_color">
        <legend class="col-form-label pt-0">Color <abbr title="required">*</abbr></legend>
        <input name="form[color]" type="hidden" value=""/>
        <div class="custom-control custom-control-inline">
          <input class="custom-control-input radio_buttons required" id="form_color_a" name="form[color]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_color_a">a</label>
        </div>
        <div class="custom-control custom-control-inline">
          <input class="custom-control-input radio_buttons required" id="form_color_b" name="form[color]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_color_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b])
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional form_pill">
        <legend class="col-form-label pt-0">Pill</legend>
        <input name="form[pill]" type="hidden" value=""/>
        <div class="custom-control">
          <input class="custom-control-input radio_buttons optional" id="form_pill_a" name="form[pill]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_pill_a">a</label>
        </div>
        <div class="custom-control">
          <input class="custom-control-input radio_buttons optional" id="form_pill_b" name="form[pill]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons_without_label
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b], legend_tag: false)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional form_pill">
        <input name="form[pill]" type="hidden" value=""/>
        <div class="custom-control">
          <input class="custom-control-input radio_buttons optional" id="form_pill_a" name="form[pill]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_pill_a">a</label>
        </div>
        <div class="custom-control">
          <input class="custom-control-input radio_buttons optional" id="form_pill_b" name="form[pill]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_inline
    actual = @builder.input(:fruit, as: :check_boxes, collection: [:a, :b], wrapper: :custom_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group check_boxes required form_fruit">
        <legend class="col-form-label pt-0">Fruit <abbr title="required">*</abbr></legend>
        <input name="form[fruit][]" type="hidden" value=""/>
        <div class="custom-control custom-control-inline">
          <input class="custom-control-input check_boxes required" id="form_fruit_a" name="form[fruit][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_fruit_a">a</label>
        </div>
        <div class="custom-control custom-control-inline">
          <input class="custom-control-input check_boxes required" id="form_fruit_b" name="form[fruit][]" type="checkbox" value="b"/>
          <label class="collection_check_boxes" for="form_fruit_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b))
    expected = <<-HTML
      <fieldset class="form-group check_boxes required form_choises">
        <legend class="col-form-label pt-0">Choises <abbr title="required">*</abbr></legend>
        <input name="form[choises][]" type="hidden" value=""/>
        <div class="custom-control">
          <input class="custom-control-input check_boxes required" id="form_choises_a" name="form[choises][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_choises_a">a</label>
        </div>
        <div class="custom-control">
          <input class="custom-control-input check_boxes required" id="form_choises_b" name="form[choises][]" type="checkbox" value="b"/>
          <label class="collection_check_boxes" for="form_choises_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_without_legend
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b), legend_tag: false)
    expected = <<-HTML
      <fieldset class="form-group check_boxes required form_choises">
        <input name="form[choises][]" type="hidden" value=""/>
        <div class="custom-control">
          <input class="custom-control-input check_boxes required" id="form_choises_a" name="form[choises][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_choises_a">a</label>
        </div>
        <div class="custom-control">
          <input class="custom-control-input check_boxes required" id="form_choises_b" name="form[choises][]" type="checkbox" value="b"/>
          <label class="collection_check_boxes" for="form_choises_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <fieldset class="form-group boolean optional form_terms">
        <div class="custom-control custom-checkbox">
          <input name="form[terms]" type="hidden" value="0"/>
          <input class="custom-control-input boolean optional" id="form_terms" name="form[terms]" type="checkbox" value="1"/>
          <label class="custom-control-label boolean optional" for="form_terms">Terms</label>
          <small class="form-text text-muted">Boolean as check box example</small>
        </div>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_switch
    actual = @builder.input(:terms, wrapper: :custom_boolean_switch)
    expected = <<-HTML
      <fieldset class="form-group boolean optional form_terms">
        <div class="custom-control custom-switch">
          <input name="form[terms]" type="hidden" value="0"/>
          <input class="custom-control-input boolean optional" id="form_terms" name="form[terms]" type="checkbox" value="1"/>
          <label class="custom-control-label boolean optional" for="form_terms">Terms</label>
          <small class="form-text text-muted">Boolean as check box example</small>
        </div>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_range_field
    actual = @builder.input(:mood, as: :range)
    expected = <<-HTML
      <div class="form-group range optional form_mood">
        <label class="form-control-label range optional" for="form_mood">Mood</label>
        <input class="custom-range numeric range optional" id="form_mood" name="form[mood]" step="1" type="range"/>
        <small class="form-text text-muted">Integer range example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
