require 'factory_girl'

FactoryGirl.define do
    factory :doctor do
        first_name "Talal"
        last_name "Shoeb"
        gender "Male"
        email "talal@cmu.edu"
        phone "97477155015"
        specialization "Dentist"
    end
    factory :appointment do
    	doctor_id 1
    	date 5.days.ago
    	schedule_id 1
	end
	factory :schedule do
		appointment_id 1
		available true
		time_slot "8 am - 9 am"
	end
end