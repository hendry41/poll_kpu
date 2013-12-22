ActiveAdmin.register Village do
  permit_params polls_attributes: [:number, :address, :admin_user_id, 
    :village_id, :sub_district_id, :male_voters, :female_voters, :backup_ballot_papers]

    index do
      column :code
      column :address
      column :name
      actions
    end

    form do |f|
      f.inputs "Input Village" do
        f.has_many :polls do |ff|
            ff.input :number
            ff.input :address
            ff.input :admin_user_id, as: :hidden, :input_html => { value: current_admin_user.id }
            ff.input :village_id, as: :select, collection: Village.all
            ff.input :male_voters
            ff.input :female_voters
            ff.input :backup_ballot_papers
        end

      end
      f.actions
    end

  end