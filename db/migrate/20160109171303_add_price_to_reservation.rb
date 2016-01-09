class AddPriceToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :price, :decimal, precision: 12, scale: 3
  end
end
