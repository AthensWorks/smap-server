class Reaction < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :smells
  
  validates_presence_of :name
end
