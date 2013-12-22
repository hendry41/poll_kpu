class SubDistrict < ActiveRecord::Base
	has_many :villages
	belongs_to :admin_user
	
	accepts_nested_attributes_for :villages

	validates :address, :name, :admin_user_id, presence: true
end
