class RemoveOrderidFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :order_id, :string
  end
end
