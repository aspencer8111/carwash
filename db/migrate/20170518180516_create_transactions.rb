class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :vehicle, foreign_key: true
      t.references :wash, foreign_key: true
      t.decimal :charge

      t.timestamps
    end
  end
end
