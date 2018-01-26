class Notebook < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title, scope: :user_id 

  include Slugfiable::InstanceMethods
  extend Slugfiable::ClassMethods

  belongs_to :user
  has_many :notes
  has_many :bookmarks
  has_many :tasks
end
