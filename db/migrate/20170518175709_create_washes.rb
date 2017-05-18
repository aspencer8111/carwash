class CreateWashes < ActiveRecord::Migration[5.0]
  def change
    create_table :washes do |t|

      t.timestamps
    end
  end
end
