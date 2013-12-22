class CandidateCountingVoicePaper < ActiveRecord::Base
	belongs_to :poll

	validates :poll_id, :candidate_id, :total, presence: true
	
end
