require 'spec_helper'

describe Provider do
  it { should have_db_column(:name) }
  it { should have_db_column(:secret) }
  it { should have_db_column(:key) }
end
