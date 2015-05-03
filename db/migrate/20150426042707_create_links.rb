class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.text :desc
      t.references :issue, index: true
      t.timestamps null: false
    end
  end
end
