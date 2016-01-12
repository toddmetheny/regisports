class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :order
      t.string :amount
      t.string :customer_email
      t.string :customer_id
      t.string :email

      t.timestamps null: false
    end
  end
end
