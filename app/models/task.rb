class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  enum status: { to_do: 0, complete: 1 }
  
  validates :name, presence: true
  validates :description, presence: true

end
