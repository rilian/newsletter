class Issue < ActiveRecord::Base
  has_many :links

  after_create :generate_title

private

  def generate_title
    update(title: "IT Watch Issue ##{id}") if title.blank?
  end
end
