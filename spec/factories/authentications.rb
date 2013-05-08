# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    oauth_expires_at "MyString"
    oauth_token "MyString"
    provider_id 1
    uid "MyString"
    user_id 1
  end
end
