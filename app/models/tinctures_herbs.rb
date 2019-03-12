class TincturesHerbs < ActiveRecord::Base
  belongs_to :tincture
  belongs_to :herb
end
