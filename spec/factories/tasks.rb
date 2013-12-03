# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence :title do |i| 
      "task number #{i}" 
    end
    description "MyText"
    completed false
    project
    factory :todo do
      completed false
    end
    factory :completed do
      completed true
    end
  end
end
