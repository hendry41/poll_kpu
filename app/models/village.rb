class Village < ActiveRecord::Base
	has_many :polls
	belongs_to :sub_district
	belongs_to :admin_user

	accepts_nested_attributes_for :polls

	validates :code, :address, :name, :admin_user_id, presence: true
end
