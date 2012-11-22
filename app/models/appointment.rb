class Appointment < ActiveRecord::Base
  attr_accessible :date, :doctor_id, :time_id
end
