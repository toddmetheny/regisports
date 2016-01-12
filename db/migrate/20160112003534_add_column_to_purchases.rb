class AddColumnToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :customer_card, :string
  end
end
