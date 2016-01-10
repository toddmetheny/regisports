class RemoveOrderIdIdFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :order_id_id, :string
  end
end
