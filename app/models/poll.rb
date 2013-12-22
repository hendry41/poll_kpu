class Poll < ActiveRecord::Base
	has_one :counting_ballot_paper
	has_many :candidate_counting_voice_papers
	has_one :out_side_poll

	belongs_to :village
	belongs_to :sub_district
	belongs_to :admin_user

	# accepts_nested_attributes_for :counting_ballot_paper
	accepts_nested_attributes_for :candidate_counting_voice_papers
	# accepts_nested_attributes_for :out_side_polls

	validates :number, :address, :admin_user_id, :village_id, :sub_district, :male_voters, :female_voters, :backup_ballot_papers, presence: true

end
