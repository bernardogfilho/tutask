# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "MyString"
    content "MyText"
    project
    user
  end
end
