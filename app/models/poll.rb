class Poll < ActiveRecord::Base
	has_one :counting_ballot_paper
	has_many :out_side_polls
	has_many :candidate_counting_voice_papers

	belongs_to :village
	belongs_to :sub_district
	belongs_to :admin_user

	accepts_nested_attributes_for :counting_ballot_paper
	accepts_nested_attributes_for :out_side_polls
	accepts_nested_attributes_for :candidate_counting_voice_papers

	validates :number, :address, :admin_user_id, :village_id, :sub_district, :male_voters, :female_voters, :backup_ballot_papers, presence: true


	def counting_papers(poll)
		(poll.male_voters + poll.female_voters + poll.backup_ballot_papers) - (poll.counting_ballot_paper.male_voters + poll.counting_ballot_paper.female_voters + poll.counting_ballot_paper.spoiled_ballot_papers + poll.counting_ballot_paper.out_side_voters)
	end
end
