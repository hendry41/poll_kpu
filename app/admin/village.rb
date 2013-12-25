ActiveAdmin.register Village do
  menu :label => "Desa"

  permit_params :code, :address, :name, :admin_user_id, :rw, :rt,
  polls_attributes: [:id, :number, :address, :admin_user_id, 
    :village_id, :sub_district_id, :male_voters, :female_voters, :backup_ballot_papers]

    filter :id, label: "Kode"
    filter :address, label: "Alamat"
    
    actions :all, :except => [:new]

    controller do

      def update
        village = Village.find(params[:id])
        village.update_attributes(village_params)
        if params[:village][:code]
          redirect_to admin_sub_district_path(village.sub_district.id)
        else
          redirect_to admin_village_path(village)
        end
      end

      def destroy
        village = Village.find(params[:id])
        village.destroy
        sub_district = village.sub_district.id
        redirect_to admin_sub_district_path(sub_district)
      end

      private

      def village_params
       params.require(:village).permit(:code, :address, :name, :admin_user_id, :rw, :rt, polls_attributes: [ :id, :number, :address, :admin_user_id, 
        :village_id, :sub_district_id, :male_voters, :female_voters, :backup_ballot_papers])
     end
   end

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
        column ("") {link_to "Cari TPS", "#", id: "search-tps"}
        column ("") {render "search"}
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
       column ("") { |poll| link_to "Ubah", "#", class: "btn-update-poll", "data-id" => poll.id }
       column ("") { |poll| link_to "Hapus", admin_poll_path(poll), :confirm => 'Anda yakin?', :method => :delete } 
       column ("") {|poll| render partial: "form_update_tps", locals: { tps: poll}}
     end
   end
 end

 form do |f|
  f.inputs "TPS Desa #{f.object.name}" do
    f.has_many :polls do |ff|
      ff.input :id, as: :hidden
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
