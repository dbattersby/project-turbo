FactoryBot.define do
  factory :user do
    username { 'john' }
    email { 'john@example.com' }
    password { 'Password123' }
  end
end