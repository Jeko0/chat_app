require "faker"

10.times do 
  user_email = Faker::Internet.email
  user_password = Faker::Number.number(digits: 6)
  User.create([{email: user_email, password: user_password, password_confirmation: user_password}])

  room_name = Faker::Company.bs 
  room_privacy = false 
  Room.create([{name: room_name, is_private: room_privacy}])
end