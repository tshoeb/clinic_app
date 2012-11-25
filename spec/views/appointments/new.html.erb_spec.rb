require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :patient_id => 1,
      :doctor_id => 1,
      :schedule_id => 1
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path, :method => "post" do
      assert_select "input#appointment_patient_id", :name => "appointment[patient_id]"
      assert_select "input#appointment_doctor_id", :name => "appointment[doctor_id]"
      assert_select "input#appointment_schedule_id", :name => "appointment[schedule_id]"
    end
  end
end
