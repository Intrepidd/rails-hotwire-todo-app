class Todo < ApplicationRecord
  validates :name, presence: true

  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  scope :ordered, -> { order(created_at: :desc) }
end
