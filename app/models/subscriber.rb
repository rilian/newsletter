class Subscriber < ActiveRecord::Base
  include Concerns::Email
  include Concerns::Uuid

  scope :is_active, ->() { where(is_active: true) }
end
