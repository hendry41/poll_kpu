ActiveAdmin.register Poll do
  permit_params counting_ballot_paper_attributes: [:poll_id, :male_voters, :female_voters, :spoiled_ballot_papers, :unauthorized, :status],
  candidate_counting_voice_papers_attributes: [:poll_id, :candidate_id, :total],
  out_side_poll_atrributes: [:poll_id, :male_voters, :female_voters]

  # actions :all, :except => [:new ]

  form  do |f|
    f.inputs "( TPS #{f.object.number} ) Counting Ballot Paper", for: [:counting_ballot_paper, f.object.counting_ballot_paper] do |ff| 
      ff.input :poll_id, input_html: { value: f.object.id }, as: :hidden
      ff.input :male_voters, as: :number
      ff.input :female_voters, as: :number
      ff.input :spoiled_ballot_papers
      ff.input :unauthorized, as: :number
      ff.input :status
    end

    f.inputs "( TPS #{f.object.number} ) Out Side Polls", for: [:out_side_poll, f.object.out_side_poll] do |ff|
      ff.input :poll_id, input_html: { value: f.object.id }, as: :hidden
      ff.input :male_voters, as: :number
      ff.input :female_voters, as: :number
    end

    f.has_many :candidate_counting_voice_papers do |ff|
      ff.input :poll_id, input_html: { value: f.object.id }, as: :hidden
      ff.input :candidate_id, as: :select, collection: Candidate.where(election_year: Date.today.year).all.map {|x| ["#{x.name_kp} - #{x.name_wkp}", x.id]}
      ff.input :total, as: :number
    end    

    

    f.actions
  end

end
