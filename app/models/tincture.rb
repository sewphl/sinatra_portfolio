class Tincture < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :orders_tinctures
  has_many :orders, through: :orders_tinctures

  has_many :tinctures_herbs, class_name: "TincturesHerbs"
  has_many :herbs, through: :tinctures_herbs

  has_many :customers, through: :orders
end
