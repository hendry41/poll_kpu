ActiveAdmin.register Poll do
  menu :label => "TPS"

  permit_params counting_ballot_paper_attributes: [:poll_id, :male_voters, :out_side_voters, :female_voters, :spoiled_ballot_papers, :unauthorized, :status],
  out_side_polls_atrributes: [:poll_id, :male_voters, :female_voters], 
  candidate_counting_voice_papers_attributes: [:poll_id, :candidate_id, :total]

  actions :all, :except => [:new ]

  filter :number, label: "No TPS"


  controller do
    before_filter :check_data, :only => :update

    def check_data
      CountingBallotPaper.delete_all("poll_id = #{params[:id]}")
      OutSidePoll.delete_all("poll_id = #{params[:id]}")
      CandidateCountingVoicePaper.delete_all("poll_id = #{params[:id]}")
    end
  end

  index do
    column "No TPS", :number
    column "Alamat", :address
    actions
  end

  show  do
    panel "TPS" do
      table_for  poll  do
        column ("Kode") { poll.number}
        column ("Alamat") { poll.address }
        column ("Jumlah Surat Suara") { poll.male_voters + poll.female_voters }
        column ("Jumlah Suart Suara Cadangan") { poll.backup_ballot_papers }
        column ("Total") { poll.male_voters + poll.female_voters + poll.backup_ballot_papers}
      end
    end

    panel "Rekap Perhitungan Suara" do
      table_for poll do
        column ("Pemilih Laki-Laki") {poll.counting_ballot_paper.male_voters}
        column ("Pemilih Perempuan") {poll.counting_ballot_paper.female_voters}
        column ("Surat Suara Rusak") {poll.counting_ballot_paper.spoiled_ballot_papers}
        column ("Tidak Sah") {poll.counting_ballot_paper.unauthorized}
        column ("Pemilih Dari luar") {poll.counting_ballot_paper.out_side_voters}
        column ("Sisa Surat Suara") { poll.counting_papers(poll)}
      end
    end

    panel "Rekap Per -  Calon KP WKP" do
      table_for poll.candidate_counting_voice_papers do 
        column "Calon KP & WKP" do |candidate_counting_voice_paper|
          "#{candidate_counting_voice_paper.candidate.name_kp} - #{candidate_counting_voice_paper.candidate.name_wkp}"
        end

        column "Jumlah Suara" do |candidate_counting_voice_paper|
          candidate_counting_voice_paper.total
        end
      end
    end

  end

  form  do |f|
    f.inputs "(Perhitungan Surat Suara TPS #{f.object.number} )", for: [:counting_ballot_paper, f.object.counting_ballot_paper || CountingBallotPaper.new] do |ff| 
      ff.input :poll_id, input_html: { value: f.object.id }, as: :hidden
      ff.input :male_voters, as: :number, label: "Pemilih Laki-Laki"
      ff.input :female_voters, as: :number, label: "Pemilih Perempuan"
      ff.input :spoiled_ballot_papers, label: "Surat Suara Rusak"
      ff.input :unauthorized, as: :number, label: "Tidak Sah"
      ff.input :out_side_voters, as: :number, label: "Pemilih Dari Luar TPS"
      ff.input :status
    end

    f.has_many :candidate_counting_voice_papers, heading: "Jumlah Surat Pemilihan Calon Kepala Daerah"  do |ff|
      ff.input :poll_id, input_html: { value: f.object.id }, as: :hidden
      ff.input :candidate_id, as: :select, label: "Calon KP & WKP",
      collection: Candidate.where(election_year: Date.today.year).all.map {|x| ["#{x.name_kp} - #{x.name_wkp} (Putaran #{x.round_elections.last.number})", x.id]}
      ff.input :total, as: :number
    end     

    f.actions
  end

end
