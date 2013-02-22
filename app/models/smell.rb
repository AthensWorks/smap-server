class Smell < ActiveRecord::Base
  attr_accessible :down_votes, :lat, :lon, :name, :up_votes
  
  has_and_belongs_to_many :reactions
  
  validates_presence_of :name,  :lat, :lon, :up_votes, :down_votes
  
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  
  def reaction_ids
    reactions.collect &:id
  end
end
