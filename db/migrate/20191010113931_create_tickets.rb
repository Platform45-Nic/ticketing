class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :number, unique: true
      t.references :event, foreign_key: true
      t.boolean :sold_originally, default: false
      t.boolean :sold_on_marketplace, default: false
      t.boolean :on_resell, default: false
      t.integer :price

      t.timestamps
    end
  end
end
