# frozen_string_literal: true
module Concerns::Uuid
  extend ActiveSupport::Concern

  included do
    after_initialize :generate_uuid, if: 'new_record?'
    validates :uuid, presence: true
  end

private

  def generate_uuid
    loop do
      self.uuid = SecureRandom.uuid
      break unless self.class.exists?(uuid: uuid)
    end
  end
end
