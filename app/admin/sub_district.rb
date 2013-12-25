ActiveAdmin.register SubDistrict do
  menu :label => "Kecamatan"
  permit_params :code, :address, :name, :admin_user_id, 
  villages_attributes: [:id, :code, :address, :name, :admin_user_id, :rw, :rt]
  
  filter :id, label: "Kode"
  filter :address, label: "Alamat"
  
  index do
    column "Kode", :code
    column "Alamat", :address
    column "Nama", :name
    actions
  end

  show do
    panel "Detail Kecamatan" do
      table_for sub_district do
        column ("Kode") { sub_district.code }
        column ("Alamat") { sub_district.address }
        column ("Nama") { sub_district.name }
        column ("Jumlah Desa") {sub_district.villages.size}
        column ("") {link_to "Cari Desa", "#", id: "btn-search-village"}
        column ("") {render "form_add"}
      end
    end

    panel "List Desa" do
      table_for params[:village_id] ? sub_district.villages.find_all_by_code(params[:village_id]) : sub_district.villages do
        column ("Kode") { |village| village.code }
        column ("Name") { |village| village.name }
        column ("Alamat") { |village| village.address }
        column ("") { |village| link_to "Lihat", admin_village_path(village.id)  } 
        column ("") { |village| link_to "Ubah", "#", class: "btn-update-village", "data-id" => village.id  } 
        column ("") { |village| link_to 'Hapus', admin_village_path(village), :confirm => 'Anda yakin?', :method => :delete  } 
        column ("") { |village| render partial: "form_update_village", locals: { village: village } }
      end
    end
  end

  form  do |f|
    f.inputs "Kecamatan" do
      f.input :code, label: "Kode"
      f.input :address, label: "Alamat"
      f.input :name, label: "Nama"
      f.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
    end

    f.has_many :villages, heading: "Desa" do |ff|
      ff.input :id, as: :hidden
      ff.input :code, label: "Kode Desa"
      ff.input :address, label: "Alamat"
      ff.input :name, label: "Nama"
      ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
    end 
    f.actions
  end

end
