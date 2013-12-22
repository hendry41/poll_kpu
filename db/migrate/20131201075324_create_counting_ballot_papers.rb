class CreateCountingBallotPapers < ActiveRecord::Migration
  def change
    create_table :counting_ballot_papers do |t|
      t.integer :poll_id
      t.integer :male_voters
      t.integer :female_voters
      t.integer :spoiled_ballot_papers
      t.integer :unauthorized
      t.string :status

      t.timestamps
    end
  end
end
