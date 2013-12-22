class CreateCandidateCountingVoicePapers < ActiveRecord::Migration
  def change
    create_table :candidate_counting_voice_papers do |t|
      t.integer :poll_id
      t.integer :candidate_id
      t.integer :total

      t.timestamps
    end
  end
end
