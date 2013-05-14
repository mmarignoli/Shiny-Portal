class Authentication < ActiveRecord::Base
  attr_accessible :oauth_expires_at, :oauth_token, :provider, :uid, :user_id

  belongs_to :user

  validates :uid, :presence => true
  validates :provider, :presence => true
  validates :oauth_token, :presence => true
  validates :user_id, :presence => true

  validates_uniqueness_of :uid, :scope => :user_id
end
