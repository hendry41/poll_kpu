class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :election_year
      t.integer :sequence_number
      t.string :name_kp
      t.string :name_wkp
      t.string :image

      t.timestamps
    end
  end
end
