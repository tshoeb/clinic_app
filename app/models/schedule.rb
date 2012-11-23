class Schedule < ActiveRecord::Base
  attr_accessible :available, :time_slot
  belongs_to :appointment
end
