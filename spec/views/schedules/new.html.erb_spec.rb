require 'spec_helper'

describe "schedules/new" do
  before(:each) do
    assign(:schedule, stub_model(Schedule,
      :time_slot => "MyString",
      :available => false
    ).as_new_record)
  end

  it "renders new schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schedules_path, :method => "post" do
      assert_select "input#schedule_time_slot", :name => "schedule[time_slot]"
      assert_select "input#schedule_available", :name => "schedule[available]"
    end
  end
end
