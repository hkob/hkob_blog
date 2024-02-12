class CustomAuthenticationFailure < Devise::FailureApp
  protected
  def redirect_url
    user_google_oauth2_omniauth_authorize_path
  end
end