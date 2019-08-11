
# add doctors data
User.create(email: "user1@gmail.com", password: "12345678", role_id: 0)
User.create(email: "user2@gmail.com", password: "12345678", role_id: 0)
User.create(email: "user3@gmail.com", password: "12345678", role_id: 0)
User.create(email: "user1@gmail.com", password: "12345678", role_id: 0)
User.create(email: "user1@gmail.com", password: "12345678", role_id: 0)
User.create(email: "admin1@gmail.com", password: "12345678", role_id: 1)


10.times do
  purchase_date = Date.parse('2019-08-10')
  phone_number = Faker::PhoneNumber.cell_phone
  surname = Faker::Coffee.blend_name
  name = Faker::Coffee.blend_name
  product_name = Faker::Device.model_name
  price_info = rand(0..1000)
  phone_imei = Faker::Device.serial
  Item.create(purchase_date: purchase_date , phone_number: phone_number, surname: surname,
     name: name, product_name: product_name, price_info: price_info, phone_imei: phone_imei )
end

# add lotteries
Lottery.create(phone_number: '99001122', lottery_number: '00000')
Lottery.create(phone_number: '99001122', lottery_number: '00001')
Lottery.create(phone_number: '99001122', lottery_number: '00010')
Lottery.create(phone_number: '99880000', lottery_number: '80000')
Lottery.create(phone_number: '99880000', lottery_number: '88000')

# Demo patient
# User.create(email: "patient1@gmail.com", password: "12345678", role_id: 1)
# User.create(email: "patient2@gmail.com", password: "12345678", role_id: 1)

# add form data
# forms = [
#   { id: 1, title: 'Form A', description: 'A auto filled' },
#   { id: 2, title: 'Form B', description: 'B 27 questions' },
#   { id: 3, title: 'Form C', description: 'C 7 questions' }
# ]
# Form.create(forms)

# add questions data
# questions = [
#   # Form A
#   { id: 1, sub_question_id: 0, form_id: 1, title: 'Question 1', description: 'Hint 1' },
#   { id: 2, sub_question_id: 0, form_id: 1, title: 'Question 2', description: 'Hint 2' },
#   { id: 3, sub_question_id: 0, form_id: 1, title: 'Question 3', description: 'Hint 3' },
#   { id: 4, sub_question_id: 0, form_id: 1, title: 'Question 4', description: 'Hint 4' },
  
#   # Form B
#   { id: 101, sub_question_id: 0, form_id: 2, title: 'Question 1', description: 'Hint 1' },
#   { id: 102, sub_question_id: 0, form_id: 2, title: 'Question 2', description: 'Hint 2' },
#   { id: 103, sub_question_id: 0, form_id: 2, title: 'Question 3', description: 'Hint 3' },
#   { id: 104, sub_question_id: 0, form_id: 2, title: 'Question 4', description: 'Hint 4' },
  
#   # Form C
#   { id: 201, sub_question_id: 0, form_id: 3, title: 'Question 1', description: 'Hint 1' },
#   { id: 202, sub_question_id: 0, form_id: 3, title: 'Question 2', description: 'Hint 2' },
#   { id: 203, sub_question_id: 1, form_id: 3, title: 'Question 3', description: 'Hint 3' },
#   { id: 204, sub_question_id: 2, form_id: 3, title: 'Question 4', description: 'Hint 4' },
  
# ]
# Question.create(questions)


# # add questions data
# answers = [
#   # Form A
#   { id: 1, user_id: 6, question_id: 1, sub_question_id: 0, form_id: 1, form_name: 'Form A', question_text: 'Question 1', value: 'YES' },
#   { id: 2, user_id: 6, question_id: 2, sub_question_id: 0, form_id: 1, form_name: 'Form A', question_text: 'Question 2', value: 'YES' },
#   { id: 3, user_id: 6, question_id: 3, sub_question_id: 0, form_id: 1, form_name: 'Form A', question_text: 'Question 3', value: 'NO' },
#   { id: 4, user_id: 6, question_id: 4, sub_question_id: 0, form_id: 1, form_name: 'Form A', question_text: 'Question 4', value: 'YES' },
  
#   # Form B
#   { id: 101, user_id: 6, question_id: 101, sub_question_id: 0, form_id: 2, form_name: 'Form B', question_text: 'Question 1', value: 'YES' },
#   { id: 102, user_id: 6, question_id: 102, sub_question_id: 0, form_id: 2, form_name: 'Form B', question_text: 'Question 2', value: 'NO' },
#   { id: 103, user_id: 6, question_id: 103, sub_question_id: 0, form_id: 2, form_name: 'Form B', question_text: 'Question 3', value: 'YES' },
#   { id: 104, user_id: 6, question_id: 104, sub_question_id: 0, form_id: 2, form_name: 'Form B', question_text: 'Question 4', value: 'YES' },

#   # Form C
#   { id: 201, user_id: 6, question_id: 201, sub_question_id: 0, form_id: 3, form_name: 'Form C', question_text: 'Question 1', value: 'NO' },
#   { id: 202, user_id: 6, question_id: 202, sub_question_id: 0, form_id: 3, form_name: 'Form C', question_text: 'Question 2', value: 'YES' },
#   { id: 203, user_id: 6, question_id: 203, sub_question_id: 1, form_id: 3, form_name: 'Form C', question_text: 'Question 3', value: 'YES' },
#   { id: 204, user_id: 6, question_id: 204, sub_question_id: 2, form_id: 3, form_name: 'Form C', question_text: 'Question 4', value: 'YES' },
  
# ]
# Answer.create(answers)
