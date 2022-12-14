FactoryBot.define do
  factory :user do
    username { 'michael' }
    email { 'michael@example.com' }
    password { 'Password123' }
  end
end