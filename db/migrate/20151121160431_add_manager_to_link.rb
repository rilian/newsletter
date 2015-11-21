class AddManagerToLink < ActiveRecord::Migration
  def change
    add_column :links, :manager_id, :integer
    add_index :links, :manager_id
  end
end
