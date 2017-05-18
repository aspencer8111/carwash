class RenameTransactionToCharge < ActiveRecord::Migration[5.0]
  def change
    rename_table :transactions, :charges
  end
end
