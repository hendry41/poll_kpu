ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role, :name

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Input admin" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: ["admin", "kecamatan", "desa", "tps"]
    end
    f.actions
  end

end
