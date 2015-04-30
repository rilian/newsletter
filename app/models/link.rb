class Link < ActiveRecord::Base
  belongs_to :issue
  belongs_to :manager

  validates :url, presence: true

  scope :without_issue, ->() { where(issue_id: nil) }

  delegate :title, to: :issue, prefix: true, allow_nil: true
  delegate :email, to: :manager, prefix: true, allow_nil: true
end
