class Provider < ActiveRecord::Base
  attr_accessible :key, :name, :secret
end
