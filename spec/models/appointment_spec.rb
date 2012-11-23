require 'spec_helper'

describe Appointment do
   before(:each) do
        @foot = FactoryGirl.create(:appointment)
        @teeth = FactoryGirl.create(:appointment, :date => 3.days.ago)
    end
    it "should have valid factories" do
        @foot.should be_valid
        @teeth.should be_valid
    end
    #it "should have the correct associations" do
     #   should has_one(:schedule)
    #end
end