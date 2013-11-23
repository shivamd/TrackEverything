FactoryGirl.define do 
  factory :topic do 
    name "My Topic"
    frequency "weekday"
    time "6:00pm"
  end

  factory :user do 
    email "person@example.com"
    password "password"
  end
end
