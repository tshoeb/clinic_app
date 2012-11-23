require 'spec_helper'

describe Doctor do
  	describe "Validation Macros" do
        it {should validate_presence_of(:first_name)}
        it {should validate_presence_of(:last_name)}
        it {should validate_presence_of(:email)}
        it {should validate_presence_of(:phone)}
        it {should validate_presence_of(:specialization)}
        it {should validate_presence_of(:gender)}
    end
    describe "Validates good emails" do
        it {should allow_value("fred@fred.com").for(:email)}
        it {should allow_value("fred@qatar.cmu.edu").for(:email)}
    end
    describe "Rejects bad emails" do
        it {should_not allow_value("fred").for(:email)}
        it {should_not allow_value("fred@fred,com").for(:email)}
    end
    describe "Validates good phone numbers" do
        it {should allow_value("97477155015").for(:phone)}
    end
    describe "Rejects bad phone numbers" do
        it {should_not allow_value("800-EAT-FOOD").for(:phone)}
    end
    describe "Validates good gender" do
        it {should allow_value("Male").for(:gender)}
        it {should allow_value("Female").for(:gender)}
    end
    describe "Rejects bad gender" do
        it {should_not allow_value("bad").for(:gender)}
    end
    it "should have the correct associations" do
        should have_many(:appointments)
    end
	describe "All factories are properly created" do
	    before(:each) do
	        @talal = FactoryGirl.create(:doctor)
	        @brad = FactoryGirl.create(:doctor, :first_name => "Brad", :last_name => "Pitt")
	        @angelina = FactoryGirl.create(:doctor, :first_name => "Angelina", :last_name => "Jolie", :phone => "974-6691-1306", :gender => "Female")
	    end
	    it "should check the creation of doctors" do
	        @talal.should be_valid
	        @brad.should be_valid
	        @angelina.should be_valid
	        @talal.first_name.should == "Talal"
	        @brad.first_name.should == "Brad"
	        @angelina.first_name.should == "Angelina"
	        @talal.gender.should == "Male"
	        @brad.gender.should == "Male"
	        @angelina.gender.should == "Female"
	    end
	    it "should remove all + and . from phone before save" do
	        @angelina.phone.should == "97466911306"
	    end
	   
	    it "should return the proper name as first_name last_name" do
	        @talal.proper_name.should == "Talal Shoeb"
	        @angelina.proper_name.should == "Angelina Jolie"
	    end
	   
	    it "should return the name as last_name, first_name" do
	        @talal.name.should == "Shoeb, Talal"
	        @angelina.name.should == "Jolie, Angelina"
	    end
	   
	    it "should return the names in alphabetical order" do
	        Doctor.alphabetical.map{|o| o.first_name}.should == ["Angelina", "Brad", "Talal"]
	    end
	end
end