class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :number_of_tickets
      t.date :date
      t.string :catagory
      t.text :description
      t.string :creator

      t.timestamps
    end
  end
end
