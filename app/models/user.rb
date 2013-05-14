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
    readonly(false).joins(:authentications).where(:authentications => {:uid => auth['uid'], :provider => auth['provider']}).first_or_initialize.tap do |user|
      user.email      = auth['info']['email']
      user.first_name = auth['info']['first_name']
      user.last_name  = auth['info']['last_name']
      user.nickname   = "#{auth['info']['first_name']} #{auth['info']['last_name']}"
      ActiveRecord::Base.transaction do
        user.save!
        Authentication.create(:oauth_expires_at => auth['credentials']['expires_at'],
                              :oauth_token      => auth['credentials']['token'],
                              :provider         => auth['provider'],
                              :uid              => auth['uid'],
                              :user_id          => user.id)
      end
    end
  end
end
