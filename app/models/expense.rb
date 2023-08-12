class Expense < ApplicationRecord
  validates :name, presence: true

  belongs_to :users, class_name: 'User', foreign_key: 'author_id'
  has_many :groups

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
