class ConvertTimeToReadToInteger < ActiveRecord::Migration
  def change
    change_column :links, :time_to_read, "integer USING CAST(REGEXP_REPLACE(COALESCE(time_to_read,'0'), '[^0-9]+', '', 'g') AS INTEGER)"
  end
end
