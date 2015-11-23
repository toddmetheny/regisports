class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :lastname
      t.integer :age
      t.string :gender
      t.string :email
      t.string :phone
      t.string :team
      t.string :shirt
      t.string :redeemcode
      t.references :option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
