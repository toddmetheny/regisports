class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.string :category
      t.date :saleEnd
      t.decimal :price
      t.decimal :fee
      t.text :description
      t.string :promocode
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
