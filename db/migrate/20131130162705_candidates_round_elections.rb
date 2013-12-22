class CandidatesRoundElections < ActiveRecord::Migration
  def change
  	create_table :candidates_round_elections, id: false do |t|
      t.references :candidate
      t.references :round_election
    end
  end
end
