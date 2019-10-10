class AddPurchaserReferencesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :purchaser, :integer, references: :users, foreign_key: true
  end
end
