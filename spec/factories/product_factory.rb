FactoryBot.define do
  sequence(:name) { |n| "#{n}" }

  factory :product do
    name 
    price {20.0} 
    description {"This is a test description"}
  end

end