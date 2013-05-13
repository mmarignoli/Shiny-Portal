require 'spec_helper'

describe "Users" do
  describe "login with omniauth" do
    it "should create a user with facebook" do
      get 'auth/facebook/callback', nil, { "omniauth.auth" => OmniAuth.config.mock_auth[:facebook] }
      puts '------------'
      puts response.to_yaml
      response.status.should be(200)
    end
  end
end
