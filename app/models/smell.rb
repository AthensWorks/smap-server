class Smell < ActiveRecord::Base
  attr_accessible :down_votes, :lat, :long, :name, :up_votes
  
  has_and_belongs_to_many :reactions
  
  validates_presence_of :name,  :lat, :long, :up_votes, :down_votes
end
