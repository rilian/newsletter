class Link < ActiveRecord::Base
  belongs_to :issue
  belongs_to :manager

  validates :url, presence: true, uniqueness: true

  scope :without_issue, ->() { where(issue_id: nil) }

  delegate :title, to: :issue, prefix: true, allow_nil: true

  before_save :cleanup_link

  TEXT_TO_OMIT = ['?utm_source=rubyweekly&utm_medium=email']

  def cleanup_link
    self.url = TEXT_TO_OMIT.reduce(url) { |url, to_omit| url.gsub(to_omit, '') }
  end
end
