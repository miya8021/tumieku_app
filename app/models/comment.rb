class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :content, presence: true, length: { maximum: 140 }
end
