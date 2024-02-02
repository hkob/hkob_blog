class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :article
end
