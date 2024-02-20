class Comment < ApplicationRecord
  include Visible

  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :article
  belongs_to :user, optional: true

  scope :order_created_at_desc, -> { order(created_at: :desc) }

  # @param [User, nil] u 確認するユーザー
  # @return [TrueClass, FalseClass] ユーザーが所有していたら true
  def owned_by?(u)
    user_id.present? && user_id == u&.id
  end

  # @return [String] ユーザー名
  def user_name
    user&.name || "削除済"
  end
end
