require 'spec_helper'

describe "doctors/show" do
  before(:each) do
    @doctor = assign(:doctor, stub_model(Doctor,
      :first_name => "First Name",
      :last_name => "Last Name",
      :gender => "Gender",
      :email => "Email",
      :phone => "Phone",
      :specialization => "Specialization"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Gender/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/Specialization/)
  end
end
