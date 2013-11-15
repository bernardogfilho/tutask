# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    position "MyString"
    email "some@mail.com"
    password "somepassword"
  end
end
