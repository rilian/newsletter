class ConvertTimeToReadToInteger < ActiveRecord::Migration
  def change
    remove_column :links, :time_to_read
    add_column :links, :time_to_read, :integer
  end
end
