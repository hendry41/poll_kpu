class RoundElection < ActiveRecord::Base
	belongs_to :candidates

	validates :date, :number, presence: true

end
