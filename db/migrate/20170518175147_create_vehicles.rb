class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.integer :type
      t.boolean :mud_in_bed
      t.boolean :bed_up

      t.timestamps
    end
  end
end
