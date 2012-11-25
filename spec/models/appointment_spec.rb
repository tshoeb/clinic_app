require 'spec_helper'

describe Appointment do
    before(:each) do
        @dentist = FactoryGirl.create(:appointment)
        @surgeon = FactoryGirl.create(:appointment, :date => 3.days.ago)
    end
    it "should have valid factories" do
        @dentist.should be_valid
        @surgeon.should be_valid
    end
    describe "Validation Macros" do
        it {should validate_presence_of(:doctor_id)}
        it {should validate_presence_of(:date)}
        it {should validate_presence_of(:schedule_id)}
        it {should validate_presence_of(:patient_id)}
    end
    it "should have the correct associations" do
        should have_one(:schedule)
        should belong_to(:doctor)
        should belong_to(:patient)
    end
    describe "Testing Scopes" do
        it "should get all the last 'x' number of vaccinations" do
            Appointment.latest(1).size.should == 1
            Appointment.latest(2).size.should == 2
        end
        it "should list in chronological order" do
            dates = Array.new
            dates << 3.days.ago.to_date
            dates << 5.days.ago.to_date
            Appointment.chronological.map{|x| x.date}.should == dates
        end
    end
end