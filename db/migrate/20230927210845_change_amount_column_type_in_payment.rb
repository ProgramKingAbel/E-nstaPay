class ChangeAmountColumnTypeInPayment < ActiveRecord::Migration[7.0]
  def change
    change_column :payments, :amount, :decimal
  end
end
