require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :doctor_id => 1,
      :time_id => 1
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path(@appointment), :method => "post" do
      assert_select "input#appointment_doctor_id", :name => "appointment[doctor_id]"
      assert_select "input#appointment_time_id", :name => "appointment[time_id]"
    end
  end
end
