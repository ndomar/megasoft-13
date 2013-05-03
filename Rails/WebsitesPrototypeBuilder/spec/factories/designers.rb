FactoryGirl.define do
  factory :designer do
    fullname 'Test Designer'
    email 'designer@gmail.com'
    password 'pass1234'
    password_confirmation 'pass1234'
    phone_number "01004509771"
    country "Egypt"
    day_dob 15
    month_dob 10
    year_dob 1990
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end

