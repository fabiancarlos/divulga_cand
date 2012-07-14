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
end
