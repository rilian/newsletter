class Manager < ActiveRecord::Base
  include Concerns::Email

  has_many :links
end
