require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it { should have_db_column(:first_name) }
  it { should have_db_column(:last_name) }
  it { should have_db_index(:email).unique(true) }
  it { should have_db_index(:nickname).unique(true) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:nickname) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:email) }

  it "is invalid with a wrong email address" do
    FactoryGirl.build(:user, email: "test@test").should_not be_valid
  end

  it { should have_many(:authentications) }
  
end
