FactoryBot.define do
  sequence(:email) { |n| "user#{n}@yahoo.de" }

  factory :user do
    email 
    password {"password"}
    first_name {"test"}
    last_name {"user"}
    admin {false}
  end

  factory :admin, class: User do
    email
    password {"password"}
    first_name {"admin"}
    last_name {"user"}
    admin {true}
  end

end