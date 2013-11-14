FactoryGirl.define do
  factory :question do
    title {generate(:random_string)}
    content {generate(:random_string)}
    answered false
    task
  end
end