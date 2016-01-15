class AddColumnToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :tax, :decimal
  end
end
