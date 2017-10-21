class Vendor < ActiveRecord::Base
	validates :name, :mobile, :email, presence:true
	validates  :mobile, :email, uniqueness:true
end
