ActiveAdmin.register Candidate do
  permit_params :election_year, :sequence_number, :name_kp, :name_wkp, 
  :image, round_elections_attributes: [:date, :number]
  
  filter :election_year, collection: (Date.today.year..Date.today.year + 3).to_a, :as => :select
  filter :name_kp
  filter :name_wkp


  index do
    column :sequence_number
    column :name_kp
    column :name_wkp
    column "Image" do |candidate| 
      image_tag(candidate.image_url(:thumb)) 
    end
    actions
  end


  form :html => { :multipart=>true } do |f|
    f.inputs "Input Candidate" do
      f.input :election_year, as: :select, 
      collection: (Date.today.year..Date.today.year + 3).to_a,
      :include_blank => false
                                    
      f.input :sequence_number
      f.input :name_kp
      f.input :name_wkp
      f.input :image

      f.has_many :round_elections do |round_election|
        round_election.inputs do
          round_election.input :date, as: :datepicker
          round_election.input :number, as: :select, collection: [1,2]
        end
      end
    end
    f.actions
  end
  
end
