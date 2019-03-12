class OrdersTinctures < ActiveRecord::Base
  belongs_to :order
  belongs_to :tincture
end
