# frozen_string_literal: true
class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
