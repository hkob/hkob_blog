class Comment < ApplicationRecord
  VALID_STATUSES = %w[public private archived]

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: VALID_STATUSES }
  belongs_to :article
  scope :order_created_at_desc, -> { order(created_at: :desc) }
end
