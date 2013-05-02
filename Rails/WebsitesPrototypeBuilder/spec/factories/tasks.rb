FactoryGirl.define do 
  factory :task do
    name 'test_task'
    description 'test_description'
    time_limit 3
    requires_reviewer_info true
  end
end
