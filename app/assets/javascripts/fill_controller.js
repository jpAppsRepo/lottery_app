$(document).ready(function() {
  'use strict';

  var Form = {
    name:       'John Smith',
    email:      'john@smith.com',
    password:   'correct-horse-battery-staple',
    avatar:     '',
    bio:        'Everyone wants to enjoy the good parts - but you have to build the framework first. Now, we are going to fluff this cloud.',
    birthday:   '',
    color:      'blue',
    fruit:      ['cherry', 'lime', 'mango'],
    music:      ['pop', 'hip_hop', 'dance'],
    choises:    ['b', 'd'],
    language:   'en',
    pill:       'red',
    friends:    '99',
    mood:       '60',
    awake:      ['08', '30'],
    first_kiss: ['21', '30'],
    active:     'Yes',
    terms:      'true',
  };
  var date_today       = new Date(),
      date_today_day   = date_today.getDate().toString().slice(-2),
      date_today_month = (date_today.getMonth() + 1).toString().slice(-2),
      date_today_year  = date_today.getFullYear().toString();

  var date_tomorrow       = new Date();
      date_tomorrow.setDate(date_tomorrow.getDate() + 1);
  var date_tomorrow_day   = date_tomorrow.getDate().toString().slice(-2),
      date_tomorrow_month = (date_tomorrow.getMonth() + 1).toString().slice(-2),
      date_tomorrow_year  = date_tomorrow.getFullYear().toString();

  var $fill_bootstrap  = $('[data-fill="bootstrap"]');
  var $fill_simpleform = $('[data-fill="simpleform"]');

  $fill_bootstrap.click(function(event) {
    $('#exampleInputName').val(Form.name);
    $('#exampleInputEmail').val(Form.email);
    $('#exampleInputPassword').val(Form.password);
    $('#exampleTextareaBio').val(Form.bio);
    $('#exampleInputDateYear').val(date_tomorrow_year);
    $('#exampleInputDateMonth').val(date_tomorrow_month);
    $('#exampleInputDateDay').val(date_tomorrow_day);
    $('#exampleInlineRadio5').prop('checked', true);
    $('#exampleInlineCheckbox3, #exampleInlineCheckbox6, #exampleInlineCheckbox7').prop('checked', true);
    $('#FormselectMusic').val(Form.music);
    $('#exampleCheckbox2, #exampleCheckbox4').prop('checked', true);
    $('#FormselectLanguage').val(Form.language);
    $('#exampleRadiosPillRed').prop('checked', true);
    $('#exampleCheckActive').prop('checked', Form.active);
    $('#exampleInputFriends').val(Form.friends);
    $('#exampleRangeMood').val(Form.mood);
    $('#exampleInputTimeHour').val(Form.awake[0]);
    $('#exampleInputTimeMinute').val(Form.awake[1]);
    $('#exampleInputDatetimeYear').val(date_today_year);
    $('#exampleInputDatetimeMonth').val(date_today_month);
    $('#exampleInputDatetimeDay').val(date_today_day);
    $('#exampleInputDatetimeHour').val(Form.first_kiss[0]);
    $('#exampleInputDatetimeMinute').val(Form.first_kiss[1]);
    $('#exampleBooleanRadioYes').prop('checked', true);
    $('#exampleCheckTerms').prop('checked', Form.terms);
  });

  $fill_simpleform.click(function(event) {
    $('#form_name').val(Form.name);
    $('#form_email').val(Form.email);
    $('#form_password').val(Form.password);
    $('#form_avatar').val(Form.avatar);
    $('#form_bio').val(Form.bio);
    $('#form_birthday').val(date_tomorrow);
    $('#form_birthday_1i').val(date_tomorrow_year);
    $('#form_birthday_2i').val(date_tomorrow_month);
    $('#form_birthday_3i').val(date_tomorrow_day);
    $('#form_color').val(Form.color);
    $('#form_color_blue').prop('checked', true);
    $('#form_fruit').val(Form.fruit[0]);
    $('#form_fruit_cherry, #form_fruit_lime, #form_fruit_mango').prop('checked', true);
    $('#form_music').val(Form.music[0]);
    $('#form_language').val(Form.language);
    $('#form_pill').val(Form.pill);
    $('#form_pill_red').prop('checked', Form.pill);
    $('#form_active').prop('checked', Form.active);
    $('#form_choises').val(Form.choises[0]);
    $('#form_choises_b, #form_choises_d').prop('checked', true);
    $('#form_friends').val(Form.friends);
    $('#form_mood').val(Form.mood);
    $('#form_awake').val(Form.awake[0]);
    $('#form_awake_4i').val(Form.awake[0]);
    $('#form_awake_5i').val(Form.awake[1]);
    $('#form_first_kiss').val(Form.first_kiss[0]);
    $('#form_first_kiss_4i').val(Form.first_kiss[0]);
    $('#form_first_kiss_5i').val(Form.first_kiss[1]);
    $('#form_active').val(Form.active);
    $('#form_active_true').prop('checked', true);
    $('#form_terms').prop('checked', Form.terms);

    if ( $('#form_avatar').attr('type') == 'hidden' ) {
      $('#form_avatar').val('file.png');
    } else {
      // $('#form_avatar').click();
    }
  });
});
