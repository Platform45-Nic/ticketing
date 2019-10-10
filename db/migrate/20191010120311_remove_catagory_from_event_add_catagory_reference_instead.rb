class RemoveCatagoryFromEventAddCatagoryReferenceInstead < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :catagory, :integer
    add_reference :events, :catagory, foreign_key: { to_table: :catagories}
  end
end
