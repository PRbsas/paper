class Notebook < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :notes
  has_many :bookmarks 
end
