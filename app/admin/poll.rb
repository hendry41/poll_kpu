ActiveAdmin.register Poll do
  permit_params counting_ballot_paper_attributes: [:poll_id, :male_voters, :female_voters, :spoiled_ballot_papers, :unauthorized, :status],
  candidate_counting_voice_paper_attributes: [:poll_id, :candidate_id, :total],
  out_side_polls_atrributes: [:poll_id, :male_voters, :female_voters]

  actions :all, :except => [:new ]

  form  do |f|
    f.inputs "Counting Ballot Paper", for: [:counting_ballot_paper, f.object.counting_ballot_paper] do |ff| 
      ff.input :poll_id
      ff.input :male_voters
      ff.input :female_voters
      ff.input :spoiled_ballot_papers
      ff.input :unauthorized
      ff.input :status
    end

    f.inputs "candidate counting voice paper", for: [:candidate_counting_voice_paper, f.object.candidate_counting_voice_paper] do |ff| 
      ff.input :poll_id
      ff.input :candidate_id
      ff.input :total
    end    

    f.has_many :out_side_polls do |ff|
      f.inputs "out_side_polls" do
        ff.input :poll_id
        ff.input :male_voters
        ff.input :female_voters
      end
    end

    f.actions
  end

end
