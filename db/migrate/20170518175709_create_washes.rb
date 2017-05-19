class CreateWashes < ActiveRecord::Migration[5.0]
  def change
    create_table :washes do |t|
      t.integer 'vehicle_id', index: true
      t.decimal 'charge'

      t.timestamps
    end
  end
end
