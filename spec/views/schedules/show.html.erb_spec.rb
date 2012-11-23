require 'spec_helper'

describe "schedules/show" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :time_slot => "Time Slot",
      :available => false,
      :appointment_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Time Slot/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
