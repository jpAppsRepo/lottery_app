require 'test_helper'

class VerticalFormTest < ActionView::TestCase
  setup do
    @form    = Form.new
    @builder = SimpleForm::FormBuilder.new(:form, @form, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_required_email_field
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="form-group email required form_email">
        <label class="form-control-label email required" for="form_email">Email address <abbr title="required">*</abbr></label>
        <input class="form-control string email required" id="form_email" name="form[email]" placeholder="Enter email" type="email"/>
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  # todo: refactor collection_radio_buttons to form-check-label
  def test_collection_as_radio_buttons_inline
    actual = @builder.input(:color, as: :radio_buttons, collection: [:a, :b], wrapper: :vertical_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons required form_color">
        <legend class="col-form-label pt-0">Color <abbr title="required">*</abbr></legend>
        <input name="form[color]" type="hidden" value=""/>
        <div class="form-check form-check-inline">
          <input class="form-check-input radio_buttons required" id="form_color_a" name="form[color]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_color_a">a</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input radio_buttons required" id="form_color_b" name="form[color]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_color_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  # todo: refactor collection_radio_buttons to form-check-label
  def test_collection_as_radio_buttons
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b])
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional form_pill">
        <legend class="col-form-label pt-0">Pill</legend>
        <input name="form[pill]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="form_pill_a" name="form[pill]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_pill_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="form_pill_b" name="form[pill]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  # todo: refactor collection_radio_buttons to form-check-label
  def test_collection_as_radio_buttons_without_label
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b], legend_tag: false)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional form_pill">
        <input name="form[pill]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="form_pill_a" name="form[pill]" type="radio" value="a"/>
          <label class="collection_radio_buttons" for="form_pill_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="form_pill_b" name="form[pill]" type="radio" value="b"/>
          <label class="collection_radio_buttons" for="form_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  # todo: refactor collection_check_boxes to form-check-label
  def test_collection_as_check_boxes_inline
    actual = @builder.input(:fruit, as: :check_boxes, collection: [:a, :b], wrapper: :vertical_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group check_boxes required form_fruit">
        <legend class="col-form-label pt-0">Fruit <abbr title="required">*</abbr></legend>
        <input name="form[fruit][]" type="hidden" value=""/>
        <div class="form-check form-check-inline">
          <input class="form-check-input check_boxes required" id="form_fruit_a" name="form[fruit][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_fruit_a">a</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input check_boxes required" id="form_fruit_b" name="form[fruit][]" type="checkbox" value="b"/>
          <label class="collection_check_boxes" for="form_fruit_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  # todo: refactor collection_check_boxes to form-check-label
  def test_collection_as_check_boxes
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b))
    expected = <<-HTML
      <fieldset class="form-group check_boxes required form_choises">
        <legend class="col-form-label pt-0">Choises <abbr title="required">*</abbr></legend>
        <input name="form[choises][]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="form_choises_a" name="form[choises][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_choises_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="form_choises_b" name="form[choises][]" type="checkbox" value="b"/>
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
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="form_choises_a" name="form[choises][]" type="checkbox" value="a"/>
          <label class="collection_check_boxes" for="form_choises_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="form_choises_b" name="form[choises][]" type="checkbox" value="b"/>
          <label class="collection_check_boxes" for="form_choises_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_radio_button
    actual = @builder.input(:active, as: :radio_buttons)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons required form_active">
        <legend class="col-form-label pt-0">Active <abbr title="required">*</abbr></legend>
        <input name="form[active]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons required" id="form_active_true" name="form[active]" type="radio" value="true"/>
          <label class="collection_radio_buttons" for="form_active_true">Yes</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons required" id="form_active_false" name="form[active]" readonly="readonly" type="radio" value="false"/>
          <label class="collection_radio_buttons" for="form_active_false">No</label>
        </div>
        <small class="form-text text-muted">Boolean as radio button example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <fieldset class="form-group boolean optional form_terms">
        <div class="form-check">
          <input name="form[terms]" type="hidden" value="0"/>
          <input class="form-check-input boolean optional" id="form_terms" name="form[terms]" type="checkbox" value="1"/>
          <label class="form-check-label boolean optional" for="form_terms">Terms</label>
          <small class="form-text text-muted">Boolean as check box example</small>
        </div>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_file_field
    actual = @builder.input(:avatar, as: :file)
    expected = <<-HTML
      <div class="form-group file required form_avatar">
        <label class="file required" for="form_avatar">Avatar <abbr title="required">*</abbr></label>
        <input class="form-control-file file required" id="form_avatar" name="form[avatar]" type="file"/>
        <small class="form-text text-muted">File input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_number_field
    actual = @builder.input(:friends)
    expected = <<-HTML
      <div class="form-group integer optional form_friends">
        <label class="form-control-label integer optional" for="form_friends">Friends</label>
        <input class="form-control numeric integer optional" id="form_friends" name="form[friends]" placeholder="Number of Friends" step="1" type="number"/>
        <small class="form-text text-muted">Integer input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_password_field
    actual = @builder.input(:password)
    expected = <<-HTML
      <div class="form-group password optional form_password">
        <label class="form-control-label password optional" for="form_password">Password</label>
        <input class="form-control password optional" id="form_password" name="form[password]" placeholder="Password" type="password"/>
        <small class="form-text text-muted">Password input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_range_field
    actual = @builder.input(:mood, as: :range)
    expected = <<-HTML
      <div class="form-group range optional form_mood">
        <label class="range optional" for="form_mood">Mood</label>
        <input class="form-control-range numeric range optional" id="form_mood" name="form[mood]" step="1" type="range"/>
        <small class="form-text text-muted">Integer range example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_field
    actual = @builder.input(:language, collection: %w(a b))
    expected = <<-HTML
      <div class="form-group select optional form_language">
        <label class="form-control-label select optional" for="form_language">Language</label>
        <select class="form-control select optional" id="form_language" name="form[language]">
          <option value=""/>
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <small class="form-text text-muted">Collection select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_multi_field
    actual = @builder.input(:music, collection: %w(a b), input_html: { multiple: true })
    expected = <<-HTML
      <div class="form-group select required form_music">
        <label class="form-control-label select required" for="form_music">Music <abbr title="required">*</abbr></label>
        <input name="form[music][]" type="hidden" value=""/>
        <select class="form-control select required" id="form_music" multiple="multiple" name="form[music][]">
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <small class="form-text text-muted">Collection multiple select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_text_field
    actual = @builder.input(:name)
    expected = <<-HTML
      <div class="form-group string required form_name">
        <label class="form-control-label string required" for="form_name">Name <abbr title="required">*</abbr></label>
        <input class="form-control string required" id="form_name" name="form[name]" placeholder="Your name" type="text"/>
        <small class="form-text text-muted">Text input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_textarea_field
    actual = @builder.input(:bio)
    expected = <<-HTML
      <div class="form-group text optional form_bio">
        <label class="form-control-label text optional" for="form_bio">Bio</label>
        <textarea class="form-control text optional" id="form_bio" name="form[bio]" placeholder="Tell us your story"></textarea>
        <small class="form-text text-muted">Textarea input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
