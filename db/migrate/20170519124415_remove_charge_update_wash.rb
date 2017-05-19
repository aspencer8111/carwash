class RemoveChargeUpdateWash < ActiveRecord::Migration[5.0]
  def change
    drop_table :washes
    remove_column :charges, :wash_id
  end
end
