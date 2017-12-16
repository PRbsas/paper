class Bookmark < ActiveRecord::Base
  validates_presence_of :link

  belongs_to :notebook
end
