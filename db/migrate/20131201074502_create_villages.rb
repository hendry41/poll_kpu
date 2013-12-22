class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.string :code
      t.string :address
      t.string :name
      t.integer :admin_user_id
      t.integer :sub_district_id

      t.timestamps
    end
  end
end
