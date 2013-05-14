class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :nickname

  has_many :authentications

  validates :first_name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :nickname, :presence => true
  validates :nickname, :uniqueness => true

  def self.from_omniauth(auth)
    joins(:authentications).where(:authentications => {:uid => auth['uid'], :provider_id => auth['provider']})
  end
end
