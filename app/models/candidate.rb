# coding: utf-8

class Candidate < ActiveRecord::Base
  attr_accessible :coalition_composition, :gender, :name, :party, :schooling_level

  validates_presence_of :name
  validates_presence_of :gender
  validates_presence_of :party
  validates_presence_of :schooling_level

  validates_uniqueness_of :name

  validates_inclusion_of :gender, in: %w(Masculino Feminino)

  scope :male,    where(gender: "Masculino")
  scope :female,  where(gender: "Feminino")

  scope :school_level,          ->(*levels){ where(schooling_level: levels) } 
  scope :basic_school_level,    school_level("Ensino Fundamental completo", "Ensino Fundamental incompleto")
  scope :middle_school_level,   school_level("Ensino Médio completo", "Ensino Médio incompleto")
  scope :superior_school_level, school_level("Superior completo", "Superior incompleto")

end
