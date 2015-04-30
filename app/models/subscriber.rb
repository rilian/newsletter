class Subscriber < ActiveRecord::Base
  include Concerns::Email
  include Concerns::Uuid

  scope :active, ->() { where(is_active: true) }
end
