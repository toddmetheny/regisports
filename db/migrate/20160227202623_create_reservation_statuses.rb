class CreateReservationStatuses < ActiveRecord::Migration
  def change
    create_table :reservation_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
