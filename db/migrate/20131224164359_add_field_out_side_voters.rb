class AddFieldOutSideVoters < ActiveRecord::Migration
  def change
  	add_column :counting_ballot_papers, :out_side_voters, :integer
  end
end
