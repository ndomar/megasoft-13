FactoryGirl.define do
  factory :project do
    project_name 'project name'
    project_type 'project type'
    description 'Description'
    designer_id '1'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end