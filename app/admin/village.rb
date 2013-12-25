ActiveAdmin.register Village do
  menu :label => "Desa"

  permit_params polls_attributes: [:number, :address, :admin_user_id, 
    :village_id, :sub_district_id, :male_voters, :female_voters, :backup_ballot_papers]

    filter :id, label: "Kode"
    filter :address, label: "Alamat"
    
    actions :all, :except => [:new]

    index do
      column "Kode", :code
      column "Alamat", :address
      column "Nama", :name
      actions
    end

    show do
      panel "Detail Desa"  do
        table_for village do
          column ("Kode") { village.code}
          column ("Alamat") { village.address }
          column ("Nama") { village.name }
          column ("Jumlah TPS") {village.polls.size}
          column ("") {link_to "Tambah Desa", "#"}
          column ("") {link_to "Cari TPS", "#"}
        end
      end

      panel "List TPS"  do
        table_for params[:poll_id] ? village.polls.find_all_by_number(params[:poll_id]) : village.polls do
         column ("Nomor") { |poll| poll.number}
         column ("Alamat") { |poll| poll.address }
         column ("Jumlah Surat Suara") { |poll| poll.male_voters + poll.female_voters }
         column ("Jumlah Suart Suara Cadangan") { |poll| poll.backup_ballot_papers }
         column ("Total") { |poll| poll.male_voters + poll.female_voters + poll.backup_ballot_papers}
         column ("") { |poll| link_to "Lihat", admin_poll_path(poll.id) }
         column ("") { |poll| link_to "Ubah#{params[:village_id]}", "#"  }
         column ("") { |poll| link_to "Hapus#{params[:village_id]}", "#" } 
       end
     end
   end

   form do |f|
    f.inputs "TPS Desa #{f.object.name}" do
      f.has_many :polls do |ff|
        ff.input :number, label: "Nomor"
        ff.input :address, label: "Alamat"
        ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
        ff.input :sub_district_id, as: :hidden, :input_html => { value: f.object.sub_district.id }
        ff.input :village_id, as: :hidden, :input_html => { value: f.object.id }
        ff.input :male_voters, label: "Pemilih Laki-Laki"
        ff.input :female_voters, label: "Pemilih Perempuan"
        ff.input :backup_ballot_papers, label: "Cadangan Surat Suara"
      end

    end
    f.actions
  end

end
