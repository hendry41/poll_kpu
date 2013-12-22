class AddRtAndRwToTableVillages < ActiveRecord::Migration
  def change
    add_column :villages, :rt, :string
    add_column :villages, :rw, :string
  end
end
