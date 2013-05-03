FactoryGirl.define do 
  factory :task do
    name 'test_task'
    description 'test_description'
    project_id 1
    page_id 1
    time_limit 3
    requires_reviewer_info true
  end
end
