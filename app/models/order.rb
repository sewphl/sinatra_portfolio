class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :orders_tinctures
  has_many :tinctures, through: :orders_tinctures
end
