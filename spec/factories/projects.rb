# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence :title do |n| 
      "Projec number #{n}"
    end
    description "MyText"
    owners {[FactoryGirl.create(:user)]}
    users {[FactoryGirl.create(:user)]}
  end
end
