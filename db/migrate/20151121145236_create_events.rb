class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :venue
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :organizer
      t.string :phone
      t.string :email
      t.string :website
      t.text   :description
      t.string :startTime
      t.string :endTime

      t.timestamps null: false
    end
  end
end
