FactoryGirl.define do
  factory :comment do
    body "My comment"
    assigned_part "1"
    page_id 1
    reviewer 1
  end
end