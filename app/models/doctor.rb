class Doctor < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :phone, :specialization
end
