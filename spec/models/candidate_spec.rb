#coding: utf-8

require 'spec_helper'

describe Candidate do
  describe "Validations" do
    before do
      Candidate.make!
    end

    it { should validate_presence_of   :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of   :gender }
    it { should validate_presence_of   :party }
    it { should validate_presence_of   :schooling_level }
  end

  describe "Gender inclusion" do
    context "Verifying the correct inclusion of" do
      let(:candidate) { Candidate.make! }

      it "should not allow 'Animal' as gender" do
        candidate.update_attribute(:gender, "Animal")
        candidate.should have(1).error_on(:gender)
      end

      it "should allow 'Feminino' as gender" do
        candidate.update_attribute(:gender, "Feminino")
        candidate.should have(0).error_on(:gender)
      end
    end
  end


  describe ".male" do
    let(:candidate_1) { Candidate.make! }
    let(:candidate_2) { Candidate.make!(gender: "Feminino") }
    
    subject { Candidate.male }

    it "should return only male candidates" do
      subject.should be_== [candidate_1]
    end
  end

  describe ".female" do
    let(:candidate_1) { Candidate.make! }
    let(:candidate_2) { Candidate.make!(gender: "Feminino") }

    subject { Candidate.female }

    it "should return only female candidates" do
      subject.should be_== [candidate_2]
    end
  end


  describe ".basic_school_level" do
    let(:candidate_1) { Candidate.make!(schooling_level: "Ensino Médio completo") }
    let(:candidate_2) { Candidate.make!(schooling_level: "Ensino Fundamental completo") }
    let(:candidate_3) { Candidate.make!(schooling_level: "Ensino Fundamental incompleto") }
    let(:candidate_4) { Candidate.make!(schooling_level: "Superior completo") }
    
    subject { Candidate.basic_school_level }

    it "should return only who have basic schooling level" do
      subject.should be_== [candidate_2, candidate_3]
    end
  end


  describe ".middle_school_level" do
    let(:candidate_1) { Candidate.make!(schooling_level: "Ensino Médio completo") }
    let(:candidate_2) { Candidate.make!(schooling_level: "Ensino Médio incompleto") }
    let(:candidate_3) { Candidate.make!(schooling_level: "Ensino Fundamental incompleto") }
    let(:candidate_4) { Candidate.make!(schooling_level: "Superior completo") }   

    subject { Candidate.middle_school_level }

    it "should return only who have basic schooling level" do
      subject.should be_== [candidate_1, candidate_2]
    end
  end


  describe ".superior_school_level" do
    let(:candidate_1) { Candidate.make!(schooling_level: "Ensino Médio completo") }
    let(:candidate_2) { Candidate.make!(schooling_level: "Superior completo") }
    let(:candidate_3) { Candidate.make!(schooling_level: "Ensino Fundamental incompleto") }
    let(:candidate_4) { Candidate.make!(schooling_level: "Superior incompleto") }      

    subject { Candidate.superior_school_level }

    it "should return only who have basic schooling level" do
      subject.should be_== [candidate_2, candidate_4]
    end
  end
end

