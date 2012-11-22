require 'spec_helper'

describe "doctors/new" do
  before(:each) do
    assign(:doctor, stub_model(Doctor,
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :specialization => "MyString"
    ).as_new_record)
  end

  it "renders new doctor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => doctors_path, :method => "post" do
      assert_select "input#doctor_first_name", :name => "doctor[first_name]"
      assert_select "input#doctor_last_name", :name => "doctor[last_name]"
      assert_select "input#doctor_gender", :name => "doctor[gender]"
      assert_select "input#doctor_email", :name => "doctor[email]"
      assert_select "input#doctor_phone", :name => "doctor[phone]"
      assert_select "input#doctor_specialization", :name => "doctor[specialization]"
    end
  end
end
