class Link < ActiveRecord::Base
  belongs_to :issue
  belongs_to :manager

  validates :url, presence: true
end
