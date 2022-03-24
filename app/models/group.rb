class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses, dependent: :destroy

  validates :name, :icon, presence: true, length: { maximum: 255 }

  def total_expenses
    expenses.sum(:amount)
  end
end
