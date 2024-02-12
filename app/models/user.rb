class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[google_oauth2]
  devise :trackable

  validates :uid, uniqueness: {scope: :provider}

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.skip_confirmation!
    end
  end
end
