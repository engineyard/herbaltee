require 'spec_helper'

describe "Herbaltee" do
  describe "#now" do
    it "formats a timestamp correctly" do
      Time.stub(:now).and_return(Time.at(0))
      Herbaltee.now.should == "19691231160000"
    end
  end
end
