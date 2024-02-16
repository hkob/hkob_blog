class Article < ApplicationRecord
  include Visible

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :user
  has_many :comments, dependent: :destroy

  delegate :name, to: :user, prefix: true

  # @param [User] u 確認するユーザー
  # @return [TrueClass, FalseClass] ユーザーが所有していたら true
  def owned_by?(u)
    user_id == u.id
  end
end
