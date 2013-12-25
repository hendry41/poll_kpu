ActiveAdmin.register SubDistrict do
  menu :label => "Kecamatan"
  permit_params :code, :address, :name, :admin_user_id, 
  villages_attributes: [:code, :address, :name, :admin_user_id, :rw, :rt]
  
  filter :id, label: "Kode"
  filter :address, label: "Alamat"
  
  index do
    column "Kode", :id
    column "Alamat", :address
    column "Nama", :name
    actions
  end

  show do
    panel "Detail Kecamatan" do
      table_for sub_district do
        column ("Kode") { sub_district.id}
        column ("Alamat") { sub_district.address }
        column ("Nama") { sub_district.name }
        column ("Jumlah Desa") {sub_district.villages.size}
        column ("") {link_to "Tambah Desa", "#"}
        column ("") {link_to "Cari Desa", "#"}

      end
    end

    panel "List Desa" do
      table_for params[:village_id] ? sub_district.villages.find_all_by_code(params[:village_id]) : sub_district.villages do
        column "Kode" do |village| village.code end
        column "Name" do |village| village.name end
        column "Alamat" do |village| village.address end
        column "" do |village| link_to "Lihat", admin_village_path(village.id)  end 
        column "" do |village| link_to "Ubah#{params[:village_id]}", "#"  end 
        column "" do |village| link_to "Hapus#{params[:village_id]}", "#"  end 
      end
    end
  end

  form  do |f|
    f.inputs "Kecamatan" do
      f.input :address, label: "Alamat"
      f.input :name, label: "Nama"
      f.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
    end

    f.has_many :villages, heading: "Desa" do |ff|
     ff.input :code, label: "Kode Desa"
     ff.input :address, label: "Alamat"
     ff.input :name, label: "Nama"
     ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
   end if f.object.villages.size.eql?(0)
   f.actions
 end

end
