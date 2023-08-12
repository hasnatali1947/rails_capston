class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_and_belongs_to_many :expenses, dependent: :destroy
  validates :icon, presence: true
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 25 }
end
