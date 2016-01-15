class AddShippingToOptions < ActiveRecord::Migration
  def change
    add_column :options, :shipping, :decimal
  end
end
