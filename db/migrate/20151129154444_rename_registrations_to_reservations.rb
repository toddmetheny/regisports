class RenameRegistrationsToReservations < ActiveRecord::Migration
  def self.up
    rename_table :registrations, :reservations
  end

  def self.down
    rename_table :reservations, :registrations
  end
end
