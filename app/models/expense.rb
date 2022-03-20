class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :expense

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
