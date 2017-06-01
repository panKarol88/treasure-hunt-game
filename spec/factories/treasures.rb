FactoryGirl.define do
  factory :treasure do
    latitude 1.5
    longitude 1.5
    name "MyString"
    active true

    factory :treasure_with_requests do
      after(:create) do |t|
        Hunter.create(id: 999, email: "treasure_with_requests@test.pl", password: "test123")
        t.requests.create(hunter_id: 999, latitude: 1.5, longitude: 1.5)
        t.requests.create(hunter_id: 999, latitude: 2, longitude: 2)
      end
    end

    factory :treasure_found do
      after(:create) do |t|
        t.hunters << Hunter.create(email: "treasure_found@test.pl", password: "test123")
      end
    end

  end
end
