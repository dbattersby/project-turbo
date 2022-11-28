FactoryBot.define do
  factory :task do
    name { "Create Design Wireframe" }
    description { "Create wireframes for all top level pages" }
    project_id { 1 }
    user_id { 1 }
    status { 0 }
  end
end
