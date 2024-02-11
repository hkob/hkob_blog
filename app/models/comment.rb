class Comment < ApplicationRecord
  include Visible

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :article
  scope :order_created_at_desc, -> { order(created_at: :desc) }
end
