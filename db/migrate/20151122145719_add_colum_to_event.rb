class AddColumToEvent < ActiveRecord::Migration
  def change
    add_column :events, :longdescription, :text
  end
end
