# frozen_string_literal: true
Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.environments = %w[production]
  config.logger = ::Logger.new('log/sentry.log')
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.async = ->(event) { Raven.send_event(event) }
end
