class Candidate < ActiveRecord::Base
  attr_accessible :coalition_composition, :gender, :name, :party, :schooling_level

  validates_presence_of :name
  validates_presence_of :gender
  validates_presence_of :party
  validates_presence_of :schooling_level

  validates_uniqueness_of :name

  validates_inclusion_of :gender, in: %w(Masculino Feminino)
    
end
