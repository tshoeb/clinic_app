require 'spec_helper'

describe "doctors/index" do
  before(:each) do
    assign(:doctors, [
      stub_model(Doctor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :email => "Email",
        :phone => "Phone",
        :specialization => "Specialization"
      ),
      stub_model(Doctor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :email => "Email",
        :phone => "Phone",
        :specialization => "Specialization"
      )
    ])
  end

  it "renders a list of doctors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Specialization".to_s, :count => 2
  end
end
