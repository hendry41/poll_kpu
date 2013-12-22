ActiveAdmin.register SubDistrict do
  permit_params :code, :address, :name, :admin_user_id, 
  villages_attributes: [:code, :address, :name, :admin_user_id, :rw, :rt]
  

  form  do |f|
    f.inputs "Input Candidate" do
      f.input :code
      f.input :address
      f.input :name
      f.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
      
     end
     f.has_many :villages do |ff|
        ff.inputs do
         ff.input :code
         ff.input :address
         ff.input :name
         ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
         ff.input :rw, label: "RW"
         ff.input :rt, label: "RT"
       end
   end
   f.actions
 end

end
