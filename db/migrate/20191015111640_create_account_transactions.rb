class CreateAccountTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :account_transactions do |t|
      t.integer :amount, null: false, default: 0
      t.references :account, foreign_key: true
      t.string :note

      t.timestamps
    end
  end
end
