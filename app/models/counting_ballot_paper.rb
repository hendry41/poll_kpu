class CountingBallotPaper < ActiveRecord::Base
	belongs_to :poll
	validates :poll_id, :male_voters, :female_voters, :spoiled_ballot_papers, :unauthorized, :status, presence: true
end
