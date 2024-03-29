class Exercise < ApplicationRecord
  belongs_to :user
  has_many :articles
  validates :name, presence: true, length: { maximum: 30 }
end