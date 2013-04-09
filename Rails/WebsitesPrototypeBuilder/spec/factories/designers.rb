FactoryGirl.define do
  factory :designer do
    fullname 'Test Designer'
    email 'designer@gmail.com'
    password 'pass1234'
    password_confirmation 'pass1234'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end