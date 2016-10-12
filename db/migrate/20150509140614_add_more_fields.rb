# frozen_string_literal: true
class AddMoreFields < ActiveRecord::Migration
  def change
    add_column :issues, :desc, :text
    add_column :links, :title, :string
  end
end
