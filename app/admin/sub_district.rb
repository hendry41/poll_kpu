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
    attributes_table do
      row ("Kode") { sub_district.id}
      row ("Alamat") { sub_district.address }
      row ("Nama") { sub_district.name }
    end
  end

  form  do |f|
    f.inputs "Kecamatan" do
      f.input :address, label: "Alamat"
      f.input :name, label: "Nama"
      f.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
    end

    f.has_many :villages, heading: "Desa" do |ff|
     ff.input :address, label: "Alamat"
     ff.input :name, label: "Nama"
     ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
   end
   f.actions
 end

end
