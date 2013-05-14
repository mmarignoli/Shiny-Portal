require 'spec_helper'

describe "Users" do
  describe "login with omniauth" do
    it "should create a user with facebook" do
      get 'auth/facebook/callback', nil, { "omniauth.auth" => OmniAuth.config.mock_auth[:facebook] }
      user = User.find_by_email(OmniAuth.config.mock_auth[:facebook]['info']['email'])
      user.should_not be_nil
    end
  end
end
