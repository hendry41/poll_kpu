class CandidateCountingVoicePaper < ActiveRecord::Base
	belongs_to :poll
	belongs_to :candidate
	
	validates :poll_id, :candidate_id, :total, presence: true
	
end
