class CreateOutSidePolls < ActiveRecord::Migration
  def change
    create_table :out_side_polls do |t|
      t.integer :poll_id
      t.integer :current_poll_id
      t.integer :male_voters
      t.integer :female_voters

      t.timestamps
    end
  end
end
