FactoryGirl.define do
  factory :request do
    association :hunter, factory: :hunter
    association :treasure, factory: :treasure
    latitude 1.5
    longitude 1.5
  end
end
