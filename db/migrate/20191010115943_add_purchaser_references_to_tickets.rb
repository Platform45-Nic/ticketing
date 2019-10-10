class AddPurchaserReferencesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :purchaser, foreign_key: { to_table: :users}
  end
end
