FactoryGirl.define do
  factory :user do
    email { Faker::Internet.free_email }
    login { Faker::Internet.user_name }
    password "p1ZwRjw6"
    password_confirmation "p1ZwRjw6"
  end
end