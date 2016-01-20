require 'uri'

class Link < ActiveRecord::Base
  belongs_to :issue
  belongs_to :manager

  validates :url, presence: true, uniqueness: true

  scope :without_issue, ->() { where(issue_id: nil) }

  delegate :title, to: :issue, prefix: true, allow_nil: true

  before_save :cleanup_link

  PARAMS_TO_OMIT = %w[utm_source utm_medium]

  def cleanup_link
    self.url = URI(url).tap do |parsed_url|
      parsed_url.query = parsed_url.query
        .split('&').lazy
        .map { |param| param.split('=') }
        .reject { |param| PARAMS_TO_OMIT.include? param.first }
        .map { |param| param.join('=') }
        .to_a.join('&')
    end.to_s
  end
end
