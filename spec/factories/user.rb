FactoryGirl.define do
  factory :admin, class: User do
    name 'admin'
    email 'admin@mail.com'
    password 'admin_password'
  end

  factory :tutor, class: User do
    name 'tutor'
    email 'tutor@mail.com'
    password 'tutor@mail.com'
  end

  factory :member, class: User do
    name 'member'
    email 'member@mail.com'
    password 'member_password'
  end

end