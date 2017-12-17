module Slugfiable

  module InstanceMethods
    def slug
      self.title.downcase.strip.gsub(" ", "-").gsub(/[^\w-]/, "")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect { |e| e.slug == slug }
    end
  end
end
