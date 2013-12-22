class CreateSubDistricts < ActiveRecord::Migration
  def change
    create_table :sub_districts do |t|
      t.string :code
      t.string :address
      t.string :name
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
