FactoryBot.define do
  factory :hospital do
    name {Faker::Company.name}
    address {Faker::Address.full_address}
  end
end
