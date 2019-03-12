module Slugifiable

  module InstanceMethods
    def slug
      if self.has_attribute?(:name)
        name.downcase.gsub(" ","-")
      elsif self.has_attribute?(:username)
        username.downcase.gsub(" ","-")
      end
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find do |c|
        c.slug == slug
      end
    end
  end

end
