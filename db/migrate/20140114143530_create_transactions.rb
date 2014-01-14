class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.date :date
      t.string :comment
      t.integer :account_id
      t.boolean :income
      t.integer :category_id

      t.timestamps
    end
  end
end
