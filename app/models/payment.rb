class Payment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates :author_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :group_ids, message: 'Please select at least one category'

  attribute :amount, :decimal, default: 0
end
