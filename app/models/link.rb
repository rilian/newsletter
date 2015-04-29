class Link < ActiveRecord::Base
  belongs_to :issue
  belongs_to :manager

  validates :url, presence: true

  scope :without_issue, ->() { where(issue_id: nil) }
end
