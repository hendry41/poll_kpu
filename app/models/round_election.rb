class RoundElection < ActiveRecord::Base
	has_and_belongs_to_many :candidates, :join_table => :candidates_round_elections

	validates :date, :number, presence: true

end
