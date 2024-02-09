class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true
  belongs_to :article
  scope :order_created_at_desc, -> { order(created_at: :desc) }
end
