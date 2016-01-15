class AddShippingToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :shipping, :decimal
  end
end
