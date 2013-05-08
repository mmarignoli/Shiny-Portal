# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider do
    name "Facebook"
    secret "0123456"
    key "acdefg123456"
  end
end
