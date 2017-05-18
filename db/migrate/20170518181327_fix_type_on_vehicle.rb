class FixTypeOnVehicle < ActiveRecord::Migration[5.0]
  def change
    rename_column :vehicles, :type, :style
  end
end
