class Customer < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_secure_password
  validates_uniqueness_of :username, :message=>"that username is already taken"
  has_many :orders
end
