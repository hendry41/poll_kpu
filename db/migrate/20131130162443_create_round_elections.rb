class CreateRoundElections < ActiveRecord::Migration
  def change
    create_table :round_elections do |t|
      t.date :date
      t.integer :number
      t.integer :candidate_id

      t.timestamps
    end
  end
end
