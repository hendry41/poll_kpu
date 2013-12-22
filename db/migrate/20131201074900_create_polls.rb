class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :number
      t.string :address
      t.integer :admin_user_id
      t.integer :sub_district_id
      t.integer :village_id
      t.integer :admin_user_id
      t.integer :male_voters
      t.integer :female_voters
      t.integer :backup_ballot_papers

      t.timestamps
    end
  end
end
