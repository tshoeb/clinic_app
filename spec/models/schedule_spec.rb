require 'spec_helper'

describe Schedule do
	before(:each) do
        @dentist = FactoryGirl.create(:schedule)
        @surgeon = FactoryGirl.create(:schedule, :time_slot => "9 am - 10 am")
        @optician = FactoryGirl.create(:schedule, :available => false, :time_slot => "10 am - 11 am")
	end
	it "should have valid factories" do
        @dentist.should be_valid
        @surgeon.should be_valid
        @optician.should be_valid
	end
  	describe "Validation Macros" do
        it {should validate_presence_of(:appointment_id)}
        it {should validate_presence_of(:time_slot)}
    end
    describe "Validates good time slot" do
        it {should allow_value("8 am - 9 am").for(:time_slot)}
        it {should allow_value("12 pm - 1 pm").for(:time_slot)}
    end
    describe "Rejects bad time slot" do
        it {should_not allow_value("bad").for(:time_slot)}
    end
    it "should have the correct associations" do
        should belong_to(:appointment)
    end
    it "should return only active owners" do
        Schedule.available.map{|o| o.time_slot}.should == ["8 am - 9 am", "9 am - 10 am"]
    end
end
