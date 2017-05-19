class RenameChargesTableToWashes < ActiveRecord::Migration[5.0]
  def change
    rename_table :charges, :washes
  end
end
