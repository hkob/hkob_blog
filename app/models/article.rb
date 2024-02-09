class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true
  has_many :comments, dependent: :destroy
end
