class ChangeEventCatagoryColumnToReference < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :catagory, :string
    add_column :events, :catagory, :integer, references: :catagory, foreign_key: true
  end
end
