class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.bigint :author_id
      t.string :name
      t.integer :amount

      t.timestamps
    end
    add_index :payments, :author_id
  end
end
