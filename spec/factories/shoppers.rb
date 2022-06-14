FactoryBot.define do
  factory :shopper do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    nif { "411111111Z" }
  end
end
