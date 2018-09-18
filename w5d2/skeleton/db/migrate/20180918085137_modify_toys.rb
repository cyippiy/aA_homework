class ModifyToys < ActiveRecord::Migration[5.1]
  def change
    rename_column :toys, :toyable_tyle,:toyable_type
  end
end
