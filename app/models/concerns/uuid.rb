module Concerns::Uuid
  extend ActiveSupport::Concern

  included do
    after_initialize :generate_uuid, if: 'new_record?'
    validates :uuid, presence: true
  end

private

  def generate_uid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(uuid: uid)
  end
end
