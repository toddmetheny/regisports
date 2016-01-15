class AddColumnToOptions < ActiveRecord::Migration
  def change
    add_column :options, :tax, :decimal
  end
end
