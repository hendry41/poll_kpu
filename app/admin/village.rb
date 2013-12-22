ActiveAdmin.register Village do
  menu :label => "Desa"

  permit_params polls_attributes: [:number, :address, :admin_user_id, 
    :village_id, :sub_district_id, :male_voters, :female_voters, :backup_ballot_papers]

    filter :id, label: "Kode"
    filter :address, label: "Alamat"
    
    actions :all, :except => [:new ]

    index do
      column "Kode", :id
      column "Alamat", :address
      column "Nama", :name
      actions
    end

    show do
      attributes_table do
        row ("Kode") { village.id}
        row ("Alamat") { village.address }
        row ("Nama") { village.name }
      end
    end

    form do |f|
      f.inputs "TPS" do
        f.has_many :polls do |ff|
          ff.input :number, label: "Nomor"
          ff.input :address, label: "Alamat"
          ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
          ff.input :village_id, as: :select, collection: Village.all, label: "Desa"
          ff.input :male_voters, label: "Pemilih Laki-Laki"
          ff.input :female_voters, label: "Pemilih Perempuan"
          ff.input :backup_ballot_papers, label: "Cadangan Surat Suara"
        end

      end
      f.actions
    end

  end
