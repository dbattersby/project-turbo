FactoryBot.define do
  factory :project do
    name { "Project 1" }
    description { "Some dummy text for project" }
    due_date { 20.days.from_now }
    status { 1 }
    active { true }
  end
end
