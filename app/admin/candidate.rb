ActiveAdmin.register Candidate do
  menu :label => "Calon"
  permit_params :election_year, :sequence_number, :name_kp, :name_wkp, 
  :image, round_elections_attributes: [:date, :number]
  
  filter :election_year, label: "Tahun Pemilu", collection: (Date.today.year..Date.today.year + 3).to_a, :as => :select

  index do
    column "No Urut", :sequence_number
    column "Nama Calon Kepala Daerah", :name_kp
    column "Nama Calon Wakil Kepala Daerah", :name_wkp
    column "Foto Pasangan Calon" do |candidate| 
      image_tag(candidate.image_url(:thumb)) 
    end
    actions
  end

  show do
    attributes_table do
    row ("No Urut") { candidate.sequence_number}
    row ("Nama Calon Kepala Daerah") { candidate.name_kp }
    row ("Nama Calon Wakil Kepala Daerah") {candidate.name_wkp}
    row ("Foto Pasangan Calon") {image_tag(candidate.image_url(:thumb))}
    end
  end

  form :html => { :multipart=>true } do |f|
    f.inputs "Calon" do
      f.input :election_year, as: :select, 
      collection: (Date.today.year..Date.today.year + 3).to_a,
      :include_blank => false, label: "Tahun Pemilihan"
                                    
      f.input :sequence_number, as: :number, label: "No Urut"
      f.input :name_kp, label: "Nama Calon Kepala Daerah"
      f.input :name_wkp, label: "Nama Calon Wakil Kepala Daerah"
      f.input :image, label: "Foto Pasangan Calon"

      f.has_many :round_elections, heading: "Putaran Pemilihan"  do |round_election|
          round_election.input :date, as: :datepicker, label: "Tanggal"
          round_election.input :number, as: :select, collection: [1,2], label: "Putaran"
      end
    end
    f.actions
  end
  
end