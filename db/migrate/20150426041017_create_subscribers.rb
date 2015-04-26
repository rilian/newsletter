class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email, null: false, index: true
      t.string :uuid, null: false, index: true
      t.boolean :is_active, null: false, default: true
      t.timestamps null: false
    end
  end
end
