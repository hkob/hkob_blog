class Article < ApplicationRecord
  VALID_STATUSES = %w[public private archived]

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: VALID_STATUSES }
  has_many :comments, dependent: :destroy
end
