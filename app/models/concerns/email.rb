module Concerns::Email
  extend ActiveSupport::Concern

  included do
    validates :email,
      uniqueness: true,
      presence: true,
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  end
end
