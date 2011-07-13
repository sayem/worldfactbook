require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Worldfactbook::CountryCode" do

  context "when there's a valid country" do
    it "should fetch country code from country name" do
      Worldfactbook::CountryCode.new('united states').code.should eql('us')
    end

    it "should return country code if valid code" do
      Worldfactbook::CountryCode.new('us').code.should eql('us')
    end

    it "should return list of codes" do
      Worldfactbook::CountryCode.new('us').list.should be_a(Hash)
    end
  end

  context "when there's no country available" do
    it "raises Worldfactbook::NoCountryAvailable" do
      proc {
        Worldfactbook::CountryCode.new('invalid country').code
      }.should raise_error(Worldfactbook::NoCountryAvailable)
    end
  end

end
