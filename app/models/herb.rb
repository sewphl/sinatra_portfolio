class Herb < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :tinctures_herbs
  has_many :tinctures, through: :tinctures_herbs
end
