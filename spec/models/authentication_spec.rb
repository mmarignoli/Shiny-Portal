require 'spec_helper'

describe Authentication do

  it { should have_db_column(:oauth_expires_at) }
  it { should have_db_column(:oauth_token) }
  it { should have_db_column(:user_id) }
  it { should have_db_column(:uid) }
  it { should have_db_column(:provider) }
  it { should have_db_index([:uid, :provider]).unique(true) }

  it { should validate_presence_of(:oauth_token) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:uid) }
  it { should validate_uniqueness_of(:uid).scoped_to(:user_id) }

  it { should belong_to(:user) }
end
