# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "MyString"
    description "MyText"
    # users {[FactoryGirl.create(:user)]}
  end
end
