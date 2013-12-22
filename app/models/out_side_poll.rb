class OutSidePoll < ActiveRecord::Base
	belongs_to :poll
	validates :poll_id, :male_voters, :female_voters, presence: true
end
