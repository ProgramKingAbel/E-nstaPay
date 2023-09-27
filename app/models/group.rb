class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, presence: true
  validates :icon, presence: true

  attribute :icon, default: 'https://www.pngmart.com/files/23/Art-PNG-Free-Download.png'
end
