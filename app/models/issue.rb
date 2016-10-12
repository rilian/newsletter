# frozen_string_literal: true
class Issue < ActiveRecord::Base
  has_many :links

  after_create :generate_title

private

  def generate_title
    update(title: "Issue ##{id}") if title.blank?
  end
end
