class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  enum status: { draft: 0, published: 1, completed: 2, archived: 3 }
end
