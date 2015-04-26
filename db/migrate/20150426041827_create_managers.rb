class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :email, null: false, index: true
      t.timestamps null: false
    end
  end
end
