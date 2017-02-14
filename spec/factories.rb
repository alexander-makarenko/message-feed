FactoryGirl.define do

  factory :user do
    sequence(:name)  { Faker::Name.first_name }
    sequence(:email) { ('a'..'z').to_a.shuffle.first(4).join + '_' + Faker::Internet.safe_email }    
  end

  factory :message do
    sequence(:body)  { Faker::Lorem.sentence(20, true) }
  end
end