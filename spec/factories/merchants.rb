FactoryBot.define do
  factory :merchant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    cif { 'B611111111' }
  end
end
